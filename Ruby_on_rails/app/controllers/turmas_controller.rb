# Controller responsável pelo gerenciamento de turmas no sistema
class TurmasController < ApplicationController
  include CrudActions
  before_action :set_turma, only: %i[ show edit update destroy ]

  # Lista todas as turmas cadastradas
  #
  # @description
  #   Recupera todas as turmas do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @turmas com lista de todas as turmas
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @turmas = Turma.all
  end

  # Exibe detalhes de uma turma específica
  #
  # @description
  #   Mostra informações detalhadas de uma turma
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @turma definido pelo before_action
  def show
  end

  # Formulário para criar nova turma
  #
  # @description
  #   Inicializa um novo objeto Turma para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @turma como nova instância de Turma
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @turma = Turma.new
  end

  # Formulário para editar turma existente
  #
  # @description
  #   Prepara formulário para edição de turma
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @turma definido pelo before_action
  def edit
  end

  # Cria uma nova turma
  #
  # @description
  #   Processa o formulário de criação de turma
  #
  # @arguments
  #   Utiliza turma_params com dados do formulário
  #
  # @return
  #   Redireciona para show em caso de sucesso
  #   Renderiza new com erros em caso de falha
  #
  # @side_effects
  #   Cria registro no banco de dados
  #   Redireciona para outra página
  def create
    @turma = Turma.new(turma_params)

    respond_to do |format|
      if @turma.save
        format.html { redirect_to @turma }
        format.json { render :show, status: :created, location: @turma }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_turma
      @turma = Turma.find(params[:id])
    end

    def turma_params
      params.expect(turma: [ :codigo, :semestre, :materium_id, :horario ])
    end
    
    def resource_class
      Turma
    end

    def resource_params
      params.require(:turma).permit(:codigo, :semestre, :materium_id, :horario)
    end

    def set_turma
      @turma = Turma.find(params[:id])
    end

    def after_destroy_path
      turmas_path
    end

    def after_update_path
      turmas_path
    end
end
