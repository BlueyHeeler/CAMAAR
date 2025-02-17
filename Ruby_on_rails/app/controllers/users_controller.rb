class UsersController < ApplicationController
  include CrudActions

  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # Remove password from params if it's blank
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

  private
    def user_params
      params.require(:user).permit(:matricula, :email, :nome, :role, :password, :password_confirmation, :avatar)
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
