class Coordenador < ApplicationRecord
  belongs_to :departamento
  belongs_to :user
end
