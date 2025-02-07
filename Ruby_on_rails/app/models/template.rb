class Template < ApplicationRecord
  has_many :questaos, dependent: :destroy
  accepts_nested_attributes_for :questaos, allow_destroy: true

  validates :nome, presence: true
  validates :publico_alvo, presence: true
  validates :semestre, presence: true
end
