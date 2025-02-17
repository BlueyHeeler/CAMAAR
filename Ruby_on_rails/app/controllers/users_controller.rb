# Controller responsável pelo gerenciamento de usuários no sistema
class UsersController < ApplicationController
  include CrudActions
  before_action :set_user, only: %i[ show edit update destroy ]

  # Lista todos os usuários cadastrados
  #
  # @description
  #   Recupera todos os usuários do banco de dados
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @users com lista de todos os usuários
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def index
    @users = User.all
  end

  # Exibe detalhes de um usuário específico
  #
  # @description
  #   Mostra informações detalhadas de um usuário
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @user definido pelo before_action
  def show
  end

  # Formulário para criar novo usuário
  #
  # @description
  #   Inicializa um novo objeto User para o formulário
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @user como nova instância de User
  #
  # @side_effects
  #   Não realiza alterações no banco
  def new
    @user = User.new
  end

  # Formulário para editar usuário existente
  #
  # @description
  #   Prepara formulário para edição de usuário
  #
  # @arguments
  #   Utiliza params[:id] definido na rota
  #
  # @return
  #   Não possui retorno direto
  #
  # @side_effects
  #   Utiliza @user definido pelo before_action
  def edit
  end

  # Atualiza um usuário existente
  #
  # @description
  #   Processa o formulário de edição de usuário
  #   Remove senha se não foi preenchida
  #
  # @arguments
  #   params[:id] - ID do usuário
  #   params[:user] - Dados do usuário
  #
  # @return
  #   Redireciona para show em caso de sucesso
  #   Renderiza edit com erros em caso de falha
  #
  # @side_effects
  #   Atualiza registro no banco de dados
  #   Redireciona para outra página
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to login_path, notice: 'User successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:matricula, :nome, :email, :password, :role, :password_confirmation, :avatar)
  end

  def resource_class
    User
  end

  def resource_params
    params.require(:user).permit(:matricula, :email, :nome, :role, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def after_create_path
    login_path
  end

  def after_destroy_path
    users_path
  end
end
