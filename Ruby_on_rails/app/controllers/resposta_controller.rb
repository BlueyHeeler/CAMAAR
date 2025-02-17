class RespostaController < ApplicationController
  include CrudActions

  before_action :set_respostum, only: %i[ show edit update destroy ]

  # GET /resposta or /resposta.json
  def index
    @resposta = Respostum.all
  end

  # GET /resposta/1 or /resposta/1.json
  def show
  end

  # GET /resposta/new
  def new
    @respostum = Respostum.new
    @questionario = Questionario.find(params[:questionario_id])
    @questoes = @questionario.template.questaos
  end

  # GET /resposta/1/edit
  def edit
  end

  # POST /resposta or /resposta.json
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
