namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do

  	puts "Instalando Dependências..."
  	%x(bundle)

  	puts "Criando a base de Dados"
  	%x(rails db:drop db:create db:migrate)

  	score = Score.create!(
      size: 1,
      adaptation_for_seniors: 2,
      medical_equipment: 3,
      medicine: 1
    )

    entry = Entry.create!(
  			name: "Primeiro UBS",
        address: "Endereço do primeiro UBS, 100",
        city: "São Paulo",
        phone: "12345-6789",
        score: score
  	)

    geocode = Geocode.create!(
      lat: -23.50573,
      long: -46.8696606,
      entry:  entry
    )

  	puts "Concluído!"
  end

end
