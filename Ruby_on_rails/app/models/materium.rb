class Materium < ApplicationRecord
  belongs_to :departamento
  has_many :turmas
end
