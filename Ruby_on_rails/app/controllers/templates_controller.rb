class TemplatesController < ApplicationController
  include CrudActions

  before_action :set_template, only: %i[ show edit update destroy ]

  # GET /templates or /templates.json
  def index
    @templates = Template.all
  end

  # GET /templates/1 or /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
  end

  private
    def resource_class
      Template
    end

    def resource_params
      params.require(:template).permit(:nome, :publico_alvo, :semestre)
    end

    def set_template
      @template = Template.find(params[:id])
    end

    def after_destroy_path
      home_gerenciamento_templates_path
    end

    def after_create_path
      home_gerenciamento_templates_path
    end

    def after_update_path
      home_gerenciamento_templates_path
    end
end
