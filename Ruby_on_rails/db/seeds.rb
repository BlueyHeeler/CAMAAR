# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

template = Template.create(nome: 'Template 1', publico_alvo: 'Estudantes', semestre: '2023.2')

questions_data = [
  { nome: 'Questão 1', texto: 'Texto da questão 1', tipo: 'multiple_choice' },
  { nome: 'Questão 2', texto: 'Texto da questão 2', tipo: 'text' }
]

template.create_questions(questions_data)
