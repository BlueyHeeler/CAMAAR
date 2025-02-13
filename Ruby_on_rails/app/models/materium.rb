class Materium < ApplicationRecord
  belongs_to :departamento
  has_many :turmas, :dependent => :destroy
end
