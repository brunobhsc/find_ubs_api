namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do

    def set_score(score_description)
      score_description = score_description.downcase!
      if score_description.include?("desempenho mediano")
        score = 1
      elsif score_description.include?("desempenho acima")
        score = 2
      elsif score_description.include?("desempenho muito acima")
        score = 3
      end
      score
    end

    puts "Instalando Dependências..."
    %x(bundle)

    puts "Criando a base de Dados (Isso pode demorar um pouco...)"
    %x(rails db:drop db:create db:migrate)

    contador = 1

    CSV.foreach("#{Rails.root}/public/ubs.csv", {col_sep: ",", headers: true}) do |row|
      data = row.to_hash.stringify_keys

      score = Score.create!(
        size: set_score(data["dsc_estrut_fisic_ambiencia"]),
        adaptation_for_seniors: set_score(data["dsc_adap_defic_fisic_idosos"]),
        medical_equipment: set_score(data["dsc_equipamentos"]),
        medicine: set_score(data["dsc_medicamentos"]),
      )

      entry = Entry.create!(
        name: data["nom_estab"],
        address: data["dsc_endereco"],
        county: data["cod_munic"],
        cnes: data["cod_cnes"],
        district: data["dsc_bairro"],
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