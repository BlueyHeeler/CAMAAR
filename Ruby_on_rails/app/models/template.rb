class Template < ApplicationRecord
  has_many :questaos
  has_many :questionarios

  def create_questions(questions_data)
    questions_data.each do |data|
      questaos.create(nome: data[:nome], texto: data[:texto], tipo: data[:tipo])
    end
  end
end
