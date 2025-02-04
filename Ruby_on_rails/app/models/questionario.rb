class Questionario < ApplicationRecord
  has_many :resposta
  belongs_to :turma
  belongs_to :template
end
