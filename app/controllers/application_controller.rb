class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def hello
    render html: "hello world"
  end

  protected
    def ensure_login
      redirect_to '/login' unless current_user 
    end

    def current_user
     @current_user ||= Pharmacy.find(session[:pharmacy_id]) if session[:pharmacy_id]
    end
end
