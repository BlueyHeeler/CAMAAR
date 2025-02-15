class Turma < ApplicationRecord
  belongs_to :materium # Associa automaticamente pela chave estrangeira `materium_id`
  has_many :questionarios, dependent: :destroy
  has_many :matriculas, dependent: :destroy
end