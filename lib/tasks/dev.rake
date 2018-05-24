namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do

  	puts "Instalando Dependências..."
  	%x(bundle)

  	puts "Criando a base de Dados"
  	%x(rails db:drop db:create db:migrate)

  end

end
