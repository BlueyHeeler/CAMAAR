# Controller responsável pelo gerenciamento de matérias no sistema
class MateriaController < ApplicationController
  include CrudActions

  before_action :set_materium, only: %i[ show edit update destroy ]

  # Lista todas as matérias cadastradas
  #
  # @description
  #   Recupera todas as matérias do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @materia com lista de todas as matérias
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @materia = Materium.all
  end

  # Exibe detalhes de uma matéria específica
  #
  # @description
  #   Mostra informações detalhadas de uma matéria
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @materium definido pelo before_action
  def show
  end

  # Formulário para criar nova matéria
  #
  # @description
  #   Inicializa um novo objeto Materium para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @materium como nova instância de Materium
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @materium = Materium.new
  end

  # Formulário para editar matéria existente
  #
  # @description
  #   Prepara formulário para edição de matéria
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @materium definido pelo before_action
  def edit
  end

  private
    # Define a classe do modelo utilizado
    #
    # @description
    #   Retorna a classe Materium para uso no CrudActions
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [Class] Retorna a classe Materium
    #
    # @side_effects
    #   Nenhum
    def resource_class
      Materium
    end

    # Define parâmetros permitidos
    #
    # @description
    #   Filtra parâmetros permitidos para criar/atualizar matéria
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
      params.require(:materium).permit(:nome, :codigo, :departamento_id)
    end

    # Configura matéria para ações que necessitam do objeto
    #
    # @description
    #   Localiza e define a matéria com base no ID
    #
    # @arguments
    #   Utiliza params[:id] da rota
    #
    # @return
    #   Define @materium com a matéria encontrada
    #
    # @side_effects
    #   Realiza consulta ao banco de dados
    def set_materium
      @materium = Materium.find(params[:id])
    end

    # Define caminho após exclusão
    #
    # @description
    #   Define rota de redirecionamento após excluir matéria
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de matérias
    #
    # @side_effects
    #   Nenhum
    def after_destroy_path
      materia_path
    end

    # Define caminho após criação
    #
    # @description
    #   Define rota de redirecionamento após criar matéria
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de matérias
    #
    # @side_effects
    #   Nenhum
    def after_create_path
      materia_path
    end

    # Define caminho após atualização
    #
    # @description
    #   Define rota de redirecionamento após atualizar matéria
    #
    # @arguments
    #   Não recebe argumentos
    #
    # @return
    #   [String] Caminho para lista de matérias
    #
    # @side_effects
    #   Nenhum
    def after_update_path
      materia_path
    end
end
