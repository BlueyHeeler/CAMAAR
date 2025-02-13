class Resposta < ApplicationRecord
  belongs_to :questao
  belongs_to :questionario
  belongs_to :user
end
