class HomeController < ApplicationController
  include MemberImportService
  def login
  end

  def homepage
  end

  def gerenciamento_templates
    @templates = Template.all
  end

  def authenticate
    user = User.find_by(matricula: params[:matricula])

    if user&.authenticate(params[:password])

      unless user.role == params[:user_role]
        flash.now[:alert] = "Invalid role for this user"
        return render :login, status: :unprocessable_entity
      end

      session[:user_id] = user.id
      session[:user_role] = user.role

      success_path = case user.role
      when "admin", "professor", "student"
          home_homepage_path
      else
          root_path
      end

      redirect_to success_path
    else
      flash.now[:alert] = "Invalid password"
      render :login, status: :unprocessable_entity
    end
  end

  def import_data_classes
    begin
      imported_data = JSON.parse(params[:imported_data])
      department_name = params[:department_name]
      department = Departamento.find_or_create_by!(nome: department_name)

      imported_data.each do |data|
        begin
          materia = Materia.find_or_create_by!(
            codigo: data["code"],
            nome: data["name"],
            departamento: department
          )

          begin
            turma = Turma.find_or_create_by!(
              codigo: data["class"]["classCode"],
              semestre: data["class"]["semester"],
              horario: data["class"]["time"],
              materium_id: materia.id
            )
          rescue => e
            raise e
          end
        rescue => e
          raise e
        end
      end

      redirect_to home_homepage_path
    rescue => e
      redirect_to home_homepage_path, alert: "Failed to import classes: #{e.message}"
    end
  end

  # Importa dados de membros (estudantes e professores)
  #
  # @description
  #   Processa dados JSON de membros e realiza importação
  #
  # @arguments
  #   params[:imported_data] - JSON com dados dos membros
  #   params[:department_name] - Nome do departamento
  #
  # @return
  #   Redireciona para homepage com mensagem de sucesso ou erro
  #
  # @side_effects
  #   Cria/atualiza registros no banco de dados
  #   Define flash messages
  #   Redireciona para outra página
  def import_data_members
    begin
      imported_data = JSON.parse(params[:imported_data])
      import_members(imported_data, params[:department_name])
      redirect_to home_homepage_path, notice: 'Members imported successfully'
    rescue => e
      redirect_to home_homepage_path, alert: "Failed to import members: #{e.message}"
    end
  end

  # Lista templates para envio
  #
  # @description
  #   Recupera todos os templates disponíveis para envio
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   Define @templates com lista de todos os templates
  #
  # @side_effects
  #   Realiza consulta ao banco de dados
  def gerenciamento_enviar_templates
    @templates = Template.all
  end
end
