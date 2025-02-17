class MateriaController < ApplicationController
  include CrudActions

  before_action :set_materium, only: %i[ show edit update destroy ]

  # GET /materia or /materia.json
  def index
    @materia = Materium.all
  end

  # GET /materia/1 or /materia/1.json
  def show
  end

  # GET /materia/new
  def new
    @materium = Materium.new
  end

  # GET /materia/1/edit
  def edit
  end

  private
    def resource_class
      Materium
    end

    def resource_params
      params.require(:materium).permit(:nome, :codigo, :departamento_id)
    end

    def set_materium
      @materium = Materium.find(params[:id])
    end

    def after_destroy_path
      materia_path
    end

    def after_create_path
      materia_path
    end

    def after_update_path
      materia_path
    end
end
