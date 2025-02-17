# Controller responsável pelo gerenciamento de questionários no sistema
class QuestionariosController < ApplicationController
  include CrudActions

  before_action :set_questionario, only: %i[ show edit update destroy ]

  # Lista todos os questionários cadastrados
  #
  # @description
  #   Recupera todos os questionários do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @questionarios com lista de todos os questionários
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @questionarios = Questionario.all
  end

  # Exibe detalhes de um questionário específico
  #
  # @description
  #   Mostra informações detalhadas de um questionário
  #   Inclui respostas, usuários e questões associadas
  #
  # @arguments
  #   params[:id] - ID do questionário
  #
  # @return
  #   Define @questionario com questionário e associações
  #
  # @side_effects
  #   Realiza consulta ao banco de dados com includes
  def show
    @questionario = Questionario.includes(respostas: :user, template: :questaos).find(params[:id])
  end

  # Formulário para criar novo questionário
  #
  # @description
  #   Inicializa novo questionário e carrega turmas
  #
  # @arguments
  #   params[:template_id] - ID do template (opcional)
  #
  # @return
  #   Define @questionario e @turmas
  #
  # @side_effects
  #   Realiza consulta ao banco para carregar turmas
  def new
    @questionario = Questionario.new
    @questionario.template_id = params[:template_id] if params[:template_id]
    @turmas = Turma.all
  end

  # Formulário para editar questionário
  #
  # @description
  #   Prepara formulário para edição de questionário
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @questionario definido pelo before_action
  def edit
  end

  private

    def resource_class
      Questionario
    end

    def resource_params
      params.require(:questionario).permit(:nome, :turma_id, :template_id, :user_id)
    end

    def set_questionario
      @questionario = Questionario.find(params[:id])
    end

    def after_destroy_path
      home_gerenciamento_enviar_templates_path
    end

    def after_create_path
      home_gerenciamento_enviar_templates_path
    end

    def after_update_path
      home_gerenciamento_enviar_templates_path
    end
end
