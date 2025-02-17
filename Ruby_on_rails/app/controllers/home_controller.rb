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

  def import_data_members
    begin
      imported_data = JSON.parse(params[:imported_data])
      import_members(imported_data, params[:department_name])
      redirect_to home_homepage_path, notice: 'Members imported successfully'
    rescue => e
      redirect_to home_homepage_path, alert: "Failed to import members: #{e.message}"
    end
  end

  def gerenciamento_enviar_templates
    @templates = Template.all
  end
end
