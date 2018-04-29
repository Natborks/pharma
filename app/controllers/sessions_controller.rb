class SessionsController < ApplicationController
#before_action :ensure_login, only: [:new, :create]
  def new
    @pharmacy = Pharmacy.new
  end

  def create
    @pharmacy = Pharmacy.find_by(email: params[:session][:email])
    password = params[:session][:password]

    if @pharmacy && @pharmacy.authenticate(password)
      session[:pharmacy_id] = @pharmacy.id
      redirect_to pharmacist_url(@pharmacy.id)
      #redirect_to root_path, notice: "Login successful"
    else
      redirect_to login_path, alert: "Invalid username/password combination"
    end
  end

  def destroy
    session[:pharmacy_id] = nil
    redirect_to login_path, notice: "You have been logged out"
  end
end
