class Materia < ApplicationRecord
  belongs_to :departamento
  has_many :turmas, foreign_key: 'materium_id'
end
