class HomeController < ApplicationController
  
  def login
  end

  def homepage
  end

  def gerenciamento_templates
  end

  def authenticate
    user = User.find_by(matricula: params[:matricula])
    puts "User found: #{user.inspect}" # Debug statement

    if user&.authenticate(params[:password])
      puts "Password authenticated" # Debug statement

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
      puts "Password authentication failed" # Debug statement
      flash.now[:alert] = "Invalid password"
      render :login, status: :unprocessable_entity
    end
  end

  def import_data_materia
    begin
      imported_data = JSON.parse(params[:imported_data])
      department_name = params[:department_name]
      department = Departamento.find_or_create_by!(nome: department_name)
      puts "Department: #{department.inspect}" # Debug statement
      puts "Imported data: #{imported_data.inspect}" # Debug statement
      imported_data.each do |data|
        materia = Materia.find_or_create_by!(codigo: data["code"], nome: data["name"], departamento: department)
        puts "Materia: #{materia.inspect}" # Debug statement
        turma = Turma.find_or_create_by!(
          codigo: data["class"]["classCode"],
          semestre: data["class"]["semester"],
          horario: data["class"]["time"],
          materium_id: materia.id
        )
        puts "Turma: #{turma.inspect}" # Debug statement
      end
      redirect_to home_homepage_path, notice: "Data imported successfully"
    rescue => e
      puts "Error importing data: #{e.message}" # Debug statement
      redirect_to home_homepage_path, alert: "Failed to import data"
    end
  end
end