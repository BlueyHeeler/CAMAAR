class Questao < ApplicationRecord
  belongs_to :template
  has_many :questao_options, dependent: :destroy
  has_many :respostas, dependent: :destroy
  
  validates :enunciado, presence: true
end
