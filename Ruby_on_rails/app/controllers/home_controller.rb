class HomeController < ApplicationController
  
  def login
  end

  def homepage
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
end