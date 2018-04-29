class PharmacistController < ApplicationController
  before_action :ensure_login, only: [:index, :show]
  def index
    @pharmacy = Pharmacy.all
  end

  def new
    @pharmacy = Pharmacy.new
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    #debugger
    @drugs = @pharmacy.drugs
  end

  def create

    @pharmacy = Pharmacy.new(pharmacy_params)
    if @pharmacy.save

      flash[:success] = "Welcome Kayak pharmacy systems!"
      session[:pharmacy] = @pharmacy.id
      redirect_to pharmacist_path(@pharmacy)
    else
      render 'new'
    end

  end

  private

    def pharmacy_params
      params.require(:pharmacy).permit(:name, :pharmacy_name, :email, :role, :region, :location, :address, :password,
                                   :password_confirmation)
    end

end
