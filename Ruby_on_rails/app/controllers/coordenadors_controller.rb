# Controller responsável pelo gerenciamento de coordenadores no sistema
class CoordenadorsController < ApplicationController
  include CrudActions

  before_action :set_coordenador, only: %i[ show edit update destroy ]

  # Lista todos os coordenadores cadastrados
  #
  # @description
  #   Recupera todos os coordenadores do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @coordenadors com lista de todos os coordenadores
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @coordenadors = Coordenador.all
  end

  # Exibe detalhes de um coordenador específico
  #
  # @description
  #   Mostra informações detalhadas de um coordenador
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @coordenador definido pelo before_action
  def show
  end

  # Formulário para criar novo coordenador
  #
  # @description
  #   Inicializa um novo objeto Coordenador para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @coordenador como nova instância de Coordenador
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @coordenador = Coordenador.new
  end

  # Formulário para editar coordenador existente
  #
  # @description
  #   Prepara formulário para edição de coordenador
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @coordenador definido pelo before_action
  def edit
  end

  private

    # Define a classe do modelo utilizado
    #
    # @description
    #   Retorna a classe Coordenador para uso no CrudActions
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [Class] Retorna a classe Coordenador
    #
    # @side_effects
    #   Nenhum
    def resource_class
      Coordenador
    end

    # Define parâmetros permitidos
    #
    # @description
    #   Filtra parâmetros permitidos para criar/atualizar coordenador
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
      params.require(:coordenador).permit(:departamento_id, :user_id)
    end

    # Configura coordenador para ações que necessitam do objeto
    #
    # @description
    #   Localiza e define o coordenador com base no ID
    #
    # @arguments
    #   Utiliza params[:id] da rota
    #
    # @return
    #   Define @coordenador com o coordenador encontrado
    #
    # @side_effects
    #   Realiza consulta ao banco de dados
    def set_coordenador
      @coordenador = Coordenador.find(params[:id])
    end

    # Define caminho após exclusão
    #
    # @description
    #   Define rota de redirecionamento após excluir coordenador
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de coordenadores
    #
    # @side_effects
    #   Nenhum
    def after_destroy_path
      coordenadors_path
    end

    # Define caminho após criação
    #
    # @description
    #   Define rota de redirecionamento após criar coordenador
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de coordenadores
    #
    # @side_effects
    #   Nenhum
    def after_create_path
      coordenadors_path
    end

    # Define caminho após atualização
    #
    # @description
    #   Define rota de redirecionamento após atualizar coordenador
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de coordenadores
    #
    # @side_effects
    #   Nenhum
    def after_update_path
      coordenadors_path
    end
end
