# Controller responsável pelo gerenciamento de questões no sistema
class QuestaosController < ApplicationController
  include CrudActions

  before_action :set_template
  before_action :set_questao, only: %i[ show edit update destroy ]

  # GET /questaos or /questaos.json
  def index
    @questaos = Questao.all
  end

  # GET /questaos/1 or /questaos/1.json
  def show
  end

  # GET /questaos/new
  def new
    @questao = @template.questaos.build
  end

  # GET /questaos/1/edit
  def edit
  end

  # Cria nova(s) questão(ões) para um template
  #
  # @description
  #   Processa o formulário de criação de questões, permitindo múltiplas questões
  #   Realiza validação e salvamento em transação
  #
  # @arguments
  #   params[:questaos] - Hash com dados das questões
  #   params[:template_id] - ID do template associado
  #
  # @return
  #   Redireciona para o template em caso de sucesso
  #   Redireciona para novo formulário em caso de erro
  #
  # @side_effects
  #   Cria registros no banco de dados
  #   Define flash messages
  #   Redireciona para outra página
  def create
    success = true
    created_questions = []

    if params[:questaos].present?
      params[:questaos].values.each do |questao_data|
        next if questao_data[:enunciado].blank? && questao_data[:texto].blank?

        @questao = @template.questaos.build(
          enunciado: questao_data[:enunciado],
          texto: questao_data[:texto]
        )

        if @questao.save
          created_questions << @questao
        else
          success = false
          break
        end
      end
    end

    respond_to do |format|
      if success && created_questions.any?
        format.html {
          redirect_to @template
        }
        format.json { render :show, status: :created, location: @template }
      else
        created_questions.each(&:destroy)
        format.html {
          redirect_to new_template_questao_path(@template),
          alert: "Erro ao criar questões."
        }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # Atualiza uma questão existente
  #
  # @description
  #   Processa o formulário de edição de questão
  #   Atualiza os atributos da questão
  #
  # @arguments
  #   params[:id] - ID da questão
  #   params[:questaos] ou params[:questao] - Dados da questão
  #
  # @return
  #   Redireciona para o template em caso de sucesso
  #   Renderiza formulário de edição em caso de erro
  #
  # @side_effects
  #   Atualiza registro no banco de dados
  #   Define flash messages
  #   Redireciona para outra página
  def update
    questao_data = params[:questaos]&.values&.first || params[:questao]
    
    respond_to do |format|
      if @questao.update(questao_params(questao_data))
        format.html { redirect_to @template }
        format.json { render :show, status: :ok, location: @questao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def questao_params(questao_data)
      return {} unless questao_data
      
      if questao_data.respond_to?(:permit)
        questao_data.permit(:enunciado, :texto)
      else
        questao_data.slice(:enunciado, :texto)
      end
    end

    def set_template
      @template = Template.find(params[:template_id])
    end

    def set_questao
      @questao = @template.questaos.find(params[:id])
    end

    def resource_class
      Questao
    end

    def resource_params
      if params[:questaos].present?
        params.require(:questaos).require("0").permit(:enunciado, :texto)
      else
        params.require(:questao).permit(:enunciado, :texto)
      end
    end

    def set_template
      @template = Template.find(params[:template_id])
    end

    def set_questao
      @questao = Questao.find(params[:id])
    end

    def after_destroy_path
      template_path(@template)
    end
end
