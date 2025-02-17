class DepartamentosController < ApplicationController
  include CrudActions

  before_action :set_departamento, only: %i[ show edit update destroy ]

  # GET /departamentos or /departamentos.json
  def index
    @departamentos = Departamento.all
  end

  # GET /departamentos/1 or /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
  end

  private
    def resource_class
      Departamento
    end

    def resource_params
      params.require(:departamento).permit(:nome)
    end

    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    def after_destroy_path
      departamentos_path
    end

    def after_create_path
      departamentos_path
    end

    def after_update_path
      departamentos_path
    end
end
