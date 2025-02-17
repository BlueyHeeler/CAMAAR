class MatriculasController < ApplicationController
  include CrudActions

  before_action :set_matricula, only: %i[ show edit update destroy ]

  # GET /matriculas or /matriculas.json
  def index
    @matriculas = Matricula.all
  end

  # GET /matriculas/1 or /matriculas/1.json
  def show
  end

  # GET /matriculas/new
  def new
    @matricula = Matricula.new
  end

  # GET /matriculas/1/edit
  def edit
  end

  private
    def resource_class
      Matricula
    end

    def resource_params
      params.require(:matricula).permit(:user_id, :turma_id)
    end

    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    def after_destroy_path
      matriculas_path
    end

    def after_create_path
      matriculas_path
    end

    def after_update_path
      matriculas_path
    end
end
