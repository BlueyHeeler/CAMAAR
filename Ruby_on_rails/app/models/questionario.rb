class Questionario < ApplicationRecord
  belongs_to :turma
  belongs_to :template
  belongs_to :user
  has_many :respostas, dependent: :destroy
end
