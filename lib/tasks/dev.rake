namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o BD...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando o BD...") { %x(rails db:create) }
      show_spinner("Migrando o BD...") { %x(rails db:migrate) }
      %x(rails dev:add_roles)
      %x(rails dev:add_people)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  desc "Cadastra funções"
  task add_roles: :environment do
    show_spinner("Cadastrando funções...") do
      roles = [
        { description: "Programador" }
      ]
      
      roles.each do |role|
        Role.find_or_create_by!(role)
      end
    end
  end
  
  desc "Cadastra pessoas"
  task add_people: :environment do
    show_spinner("Cadastrando pessoas...") do
      people = [
        { description: "Bruno", url_image: "", role: Role.first }
      ]
      
      people.each do |person|
        Person.find_or_create_by!(person)
      end
    end
  end
  
  private
  
    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("#{msg_end}")
    end
end
