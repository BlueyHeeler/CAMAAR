class CoordenadorsController < ApplicationController
  include CrudActions

  before_action :set_coordenador, only: %i[ show edit update destroy ]

  # GET /coordenadors or /coordenadors.json
  def index
    @coordenadors = Coordenador.all
  end

  # GET /coordenadors/1 or /coordenadors/1.json
  def show
  end

  # GET /coordenadors/new
  def new
    @coordenador = Coordenador.new
  end

  # GET /coordenadors/1/edit
  def edit
  end

  private
    def resource_class
      Coordenador
    end

    def resource_params
      params.require(:coordenador).permit(:departamento_id, :user_id)
    end

    def set_coordenador
      @coordenador = Coordenador.find(params[:id])
    end

    def after_destroy_path
      coordenadors_path
    end

    def after_create_path
      coordenadors_path
    end

    def after_update_path
      coordenadors_path
    end
end
