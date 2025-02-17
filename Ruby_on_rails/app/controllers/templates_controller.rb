# Controller responsável pelo gerenciamento de templates no sistema
class TemplatesController < ApplicationController
  include CrudActions
  before_action :set_template, only: %i[ show edit update destroy ]

  # Lista todos os templates cadastrados
  #
  # @description
  #   Recupera todos os templates do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @templates com lista de todos os templates
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @templates = Template.all
  end

  # Exibe detalhes de um template específico
  #
  # @description
  #   Mostra informações detalhadas de um template
  #   Inclui questões associadas
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Define @template com template e questões
  #
  # @side_effects
  #   Realiza consulta ao banco de dados com includes
  def show
  end

  # Formulário para criar novo template
  #
  # @description
  #   Inicializa um novo objeto Template para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @template como nova instância de Template
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @template = Template.new
  end

  # Formulário para editar template existente
  #
  # @description
  #   Prepara formulário para edição de template
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @template definido pelo before_action
  def edit
  end

  # Cria novo template
  #
  # @description
  #   Processa o formulário de criação de template
  #
  # @arguments
  #   Utiliza template_params para obter os parâmetros do template
  #
  # @return
  #   Redireciona para a lista de templates
  #
  # @side_effects
  #   Cria um novo template no banco de dados
  def create
    @template = Template.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to home_gerenciamento_templates_path }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def template_params
      params.require(:template).permit(:nome, :publico_alvo, :semestre)
    end

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
