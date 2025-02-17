# Controller responsável pelo gerenciamento de respostas no sistema
class RespostaController < ApplicationController
  include CrudActions

  before_action :set_respostum, only: %i[ show edit update destroy ]

  # Lista todas as respostas cadastradas
  #
  # @description
  #   Recupera todas as respostas do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @resposta com lista de todas as respostas
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @resposta = Respostum.all
  end

  # Exibe detalhes de uma resposta específica
  #
  # @description
  #   Mostra informações detalhadas de uma resposta
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @respostum definido pelo before_action
  def show
  end

  # Formulário para criar nova resposta
  #
  # @description
  #   Inicializa um novo objeto Respostum para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @respostum como nova instância de Respostum
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @respostum = Respostum.new
    @questionario = Questionario.find(params[:questionario_id])
    @questoes = @questionario.template.questaos
  end

  # Formulário para editar resposta existente
  #
  # @description
  #   Prepara formulário para edição de resposta
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @respostum definido pelo before_action
  def edit
  end

  # Cria uma nova resposta
  #
  # @description
  #   Cria uma nova resposta no banco de dados
  #
  # @arguments
  #   Utiliza params[:respostas] definido no formulário
  #
  # @return
  #   Redireciona para a página inicial
  #
  # @side_effects
  #   Cria uma nova resposta no banco de dados
  def create
    success = true

    params[:respostas].each do |resposta_params|
      @respostum = Respostum.new(resposta_params.permit(:valor, :questao_id, :questionario_id, :user_id))
      unless @respostum.save
        success = false
        break
      end
    end

    if success
      redirect_to home_homepage_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def resource_class
      Respostum
    end

    def resource_params
      params.require(:respostum).permit(:valor, :questao_id, :questionario_id, :user_id)
    end

    def set_respostum
      @respostum = Respostum.find(params[:id])
    end

    def after_destroy_path
      resposta_path
    end

    def after_create_path
      resposta_path
    end

    def after_update_path
      resposta_path
    end
end
