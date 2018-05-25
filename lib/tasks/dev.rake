namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do

    puts "Instalando Dependências..."
    %x(bundle)

    puts "Criando a base de Dados (Isso pode demorar um pouco...)"
    %x(rails db:drop db:create db:migrate)

    contador = 1

    CSV.foreach("#{Rails.root}/public/ubs.csv", {col_sep: ",", headers: true}) do |row|
      data = row.to_hash.stringify_keys
      
      score = Score.create!(
        size: data["dsc_estrut_fisic_ambiencia"],
        adaptation_for_seniors: data["dsc_adap_defic_fisic_idosos"],
        medical_equipment: data["dsc_equipamentos"],
        medicine: data["dsc_medicamentos"],
      )

      entry = Entry.create!(
        name: data["nom_estab"],
        address: data["dsc_endereco"],
        city: data["dsc_cidade"],
        phone: data["dsc_telefone"],
        score: score
      )

      geocode = Geocode.create!(
        lat: data["vlr_latitude"],
        long: data["vlr_longitude"],
        entry:  entry
      )

      puts "UBS criado(s) #{contador}"
      
      contador += 1

    end

    puts "Concluído!"
  end

end