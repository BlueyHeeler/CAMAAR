class Turma < ApplicationRecord
  belongs_to :materium
  has_many :questionarios
end
