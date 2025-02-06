class Turma < ApplicationRecord
  belongs_to :materium, class_name: 'Materia', foreign_key: 'materium_id'
  has_many :questionarios
end
