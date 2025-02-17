# Controller responsável pelo gerenciamento de matrículas no sistema
class MatriculasController < ApplicationController
  include CrudActions

  before_action :set_matricula, only: %i[ show edit update destroy ]

  # Lista todas as matrículas cadastradas
  #
  # @description
  #   Recupera todas as matrículas do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @matriculas com lista de todas as matrículas
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @matriculas = Matricula.all
  end

  # Exibe detalhes de uma matrícula específica
  #
  # @description
  #   Mostra informações detalhadas de uma matrícula
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @matricula definido pelo before_action
  def show
  end

  # Formulário para criar nova matrícula
  #
  # @description
  #   Inicializa um novo objeto Matricula para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @matricula como nova instância de Matricula
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @matricula = Matricula.new
  end

  # Formulário para editar matrícula existente
  #
  # @description
  #   Prepara formulário para edição de matrícula
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @matricula definido pelo before_action
  def edit
  end

  private
    # Define a classe do modelo utilizado
    #
    # @description
    #   Retorna a classe Matricula para uso no CrudActions
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [Class] Retorna a classe Matricula
    #
    # @side_effects
    #   Nenhum
    def resource_class
      Matricula
    end

    # Define parâmetros permitidos
    #
    # @description
    #   Filtra parâmetros permitidos para criar/atualizar matrícula
    #
    # @arguments
    #   Utiliza params do request
    #
    # @return
    #   [ActionController::Parameters] Parâmetros filtrados
    #
    # @side_effects
    #   Nenhum
    def resource_params
      params.require(:matricula).permit(:user_id, :turma_id)
    end

    # Configura matrícula para ações que necessitam do objeto
    #
    # @description
    #   Localiza e define a matrícula com base no ID
    #
    # @arguments
    #   Utiliza params[:id] da rota
    #
    # @return
    #   Define @matricula com a matrícula encontrada
    #
    # @side_effects
    #   Realiza consulta ao banco de dados
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    # Define caminho após exclusão
    #
    # @description
    #   Define rota de redirecionamento após excluir matrícula
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de matrículas
    #
    # @side_effects
    #   Nenhum
    def after_destroy_path
      matriculas_path
    end

    # Define caminho após criação
    #
    # @description
    #   Define rota de redirecionamento após criar matrícula
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de matrículas
    #
    # @side_effects
    #   Nenhum
    def after_create_path
      matriculas_path
    end

    # Define caminho após atualização
    #
    # @description
    #   Define rota de redirecionamento após atualizar matrícula
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de matrículas
    #
    # @side_effects
    #   Nenhum
    def after_update_path
      matriculas_path
    end
end
