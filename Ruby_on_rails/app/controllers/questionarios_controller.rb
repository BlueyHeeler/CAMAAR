class QuestionariosController < ApplicationController
  include CrudActions

  before_action :set_questionario, only: %i[ show edit update destroy ]

  # GET /questionarios or /questionarios.json
  def index
    @questionarios = Questionario.all
  end

  # GET /questionarios/1 or /questionarios/1.json
  def show
    @questionario = Questionario.includes(respostas: :user, template: :questaos).find(params[:id])
  end

  # GET /questionarios/new
  def new
    @questionario = Questionario.new
    @questionario.template_id = params[:template_id] if params[:template_id]
    @turmas = Turma.all
  end

  # GET /questionarios/1/edit
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
