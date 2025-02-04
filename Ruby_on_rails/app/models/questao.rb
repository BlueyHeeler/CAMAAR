class Questao < ApplicationRecord
  belongs_to: template
  has_many: questao_options
  validates :tipo, inclusion: { in: ['multipla_escolha', 'dissertativa', 'certo_ou_errado'] }
  
  after_create :create_options, if: :multipla_escolha?

  private

  def multipla_escolha?
    tipo == 'multipla_escolha'
  end

  def create_options(comentario)
    raise ArgumentError, "Comentario cannot be nil" if comentario.nil?

    5.times do |i|
      QuestaoOption.create(nome: "#{i +1}.", texto: comentario)
    end
  end
end
