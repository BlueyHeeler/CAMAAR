class HomeController < ApplicationController
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
      department_name = params[:department_name]
      department = Departamento.find_or_create_by!(nome: department_name)

      imported_data.each do |data|
        # Get the turma before processing users
        materia = Materia.find_by(codigo: data["code"])
        next unless materia

        turma = Turma.find_by(
          codigo: data["classCode"],
          semestre: data["semester"],
          materium_id: materia.id
        )

        # Import dicentes
        if data["dicente"] && turma.present?
          data["dicente"].each do |dicente_data|
            next unless dicente_data["matricula"] && dicente_data["email"] && dicente_data["nome"]

            user = User.where(
              matricula: dicente_data["matricula"],
              email: dicente_data["email"],
              nome: dicente_data["nome"],
              role: "student"
            ).first_or_initialize

            if user.new_record?
              user.password = "password123"
              user.password_confirmation = "password123"
              user.save!
            end

            matricula = Matricula.find_or_create_by!(
              user_id: user.id,
              turma_id: turma.id
            )
          end
        end

        # Import docente
        if data["docente"]
          docente_data = data["docente"]
          next unless docente_data["usuario"] && docente_data["email"] && docente_data["nome"]

          user = User.where(
            matricula: docente_data["usuario"],
            email: docente_data["email"],
            nome: docente_data["nome"],
            role: "professor"
          ).first_or_initialize

          if user.new_record?
            user.password = "password123"
            user.password_confirmation = "password123"
            user.save!
          end

          matricula = Matricula.find_or_create_by!(
              user_id: user.id,
              turma_id: turma.id
            )
        end
      end

      redirect_to home_homepage_path
    rescue => e
      redirect_to home_homepage_path, alert: "Failed to import members: #{e.message}"
    end
  end

  def gerenciamento_enviar_templates
    @templates = Template.all
  end
end
