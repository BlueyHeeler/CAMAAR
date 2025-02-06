class HomeController < ApplicationController
  
  def login
  end

  def homepage
  end

  def gerenciamento_templates
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
        when "admin"
          home_homepage_path
        when "student"
          home_homepage_path
        else
          root_path
      end

      redirect_to success_path, notice: "Logged in successfully"
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
      puts "\n=== Starting Import ==="
      puts "Department: #{department.inspect}"
      puts "Total items to import: #{imported_data.length}"

      imported_data.each do |data|
        puts "\nProcessing: #{data.inspect}"
        
        begin
          materia = Materia.find_or_create_by!(
            codigo: data["code"],
            nome: data["name"],
            departamento: department
          )
          puts "Successfully created/found Materia: #{materia.inspect}"

          begin
            turma = Turma.find_or_create_by!(
              codigo: data["class"]["classCode"],
              semestre: data["class"]["semester"],
              horario: data["class"]["time"],
              materium_id: materia.id
            )
            puts "Successfully created/found Turma: #{turma.inspect}"
          rescue => e
            puts "Error creating Turma: #{e.message}"
            puts "Turma data: #{data["class"].inspect}"
            raise e
          end
        rescue => e
          puts "Error creating Materia: #{e.message}"
          puts "Materia data: #{data.inspect}"
          raise e
        end
      end
      
      puts "\n=== Import Summary ==="
      puts "Total Materias: #{Materia.count}"
      puts "Total Turmas: #{Turma.count}"
      
      redirect_to home_homepage_path, notice: "Classes imported successfully"
    rescue => e
      puts "Error importing classes: #{e.message}"
      puts "Full error: #{e.inspect}"
      redirect_to home_homepage_path, alert: "Failed to import classes: #{e.message}"
    end
  end

  def import_data_members
    begin
      imported_data = JSON.parse(params[:imported_data])
      department_name = params[:department_name]
      department = Departamento.find_or_create_by!(nome: department_name)

      puts "\n=== Starting Member Import ==="
      puts "Department: #{department.inspect}"

      imported_data.each do |data|
        # Get the turma before processing users
        materia = Materia.find_by(codigo: data["code"])
        next unless materia

        turma = Turma.find_by(
          codigo: data["classCode"],
          semestre: data["semester"],
          materium_id: materia.id
        )
        puts "\nFound Turma: #{turma.inspect}"

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
            puts "Created/Found Student: #{user.inspect}"

            matricula = Matricula.find_or_create_by!(
              user_id: user.id,
              turma_id: turma.id
            )
            puts "Created/Found Matricula: #{matricula.inspect}"
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
            role: "admin"
          ).first_or_initialize

          if user.new_record?
            user.password = "password123"
            user.password_confirmation = "password123"
            user.save!
          end
          puts "Created/Found Professor: #{user.inspect}"
        end
      end

      redirect_to home_homepage_path, notice: "Members imported successfully"
    rescue => e
      puts "Error importing members: #{e.message}"
      puts "Full error: #{e.inspect}"
      redirect_to home_homepage_path, alert: "Failed to import members: #{e.message}"
    end
  end
end