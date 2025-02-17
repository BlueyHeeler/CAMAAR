# Controller responsável pelo gerenciamento de departamentos no sistema
class DepartamentosController < ApplicationController
  include CrudActions

  before_action :set_departamento, only: %i[ show edit update destroy ]

  # Lista todos os departamentos cadastrados
  #
  # @description
  #   Recupera todos os departamentos do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @departamentos com lista de todos os departamentos
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @departamentos = Departamento.all
  end

  # Exibe detalhes de um departamento específico
  #
  # @description
  #   Mostra informações detalhadas de um departamento
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @departamento definido pelo before_action
  def show
  end

  # Formulário para criar novo departamento
  #
  # @description
  #   Inicializa um novo objeto Departamento para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @departamento como nova instância de Departamento
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @departamento = Departamento.new
  end

  # Formulário para editar departamento existente
  #
  # @description
  #   Prepara formulário para edição de departamento
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @departamento definido pelo before_action
  def edit
  end

  private

    # Define a classe do modelo utilizado
    #
    # @description
    #   Retorna a classe Departamento para uso no CrudActions
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [Class] Retorna a classe Departamento
    #
    # @side_effects
    #   Nenhum
    def resource_class
      Departamento
    end

    # Define parâmetros permitidos
    #
    # @description
    #   Filtra parâmetros permitidos para criar/atualizar departamento
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
      params.require(:departamento).permit(:nome)
    end

    # Configura departamento para ações que necessitam do objeto
    #
    # @description
    #   Localiza e define o departamento com base no ID
    #
    # @arguments
    #   Utiliza params[:id] da rota
    #
    # @return
    #   Define @departamento com o departamento encontrado
    #
    # @side_effects
    #   Realiza consulta ao banco de dados
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Define caminho após exclusão
    #
    # @description
    #   Define rota de redirecionamento após excluir departamento
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de departamentos
    #
    # @side_effects
    #   Nenhum
    def after_destroy_path
      departamentos_path
    end

    # Define caminho após criação
    #
    # @description
    #   Define rota de redirecionamento após criar departamento
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de departamentos
    #
    # @side_effects
    #   Nenhum
    def after_create_path
      departamentos_path
    end

    # Define caminho após atualização
    #
    # @description
    #   Define rota de redirecionamento após atualizar departamento
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de departamentos
    #
    # @side_effects
    #   Nenhum
    def after_update_path
      departamentos_path
    end
end
