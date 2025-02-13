class Questao < ApplicationRecord
  belongs_to :template
  has_many :respostas, dependent: :destroy
  
  validates :enunciado, presence: true
end
