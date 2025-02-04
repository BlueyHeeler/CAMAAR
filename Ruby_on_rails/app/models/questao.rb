class Questao < ApplicationRecord
  belongs_to :template
  has_many :questao_options
  validates :tipo, inclusion: { in: ['multipla_escolha', 'dissertativa', 'certo_ou_errado'] }
  
  private

  def multipla_escolha?
    tipo == 'multipla_escolha'
  end

end
