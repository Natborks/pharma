class PharmacistController < ApplicationController
  def new
    @pharmacy = Pharmacy.new
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    #debugger
  end

  def create
    @pharmacy = Pharmacy.new(pharmacy_params)
    if @pharmacy.save
      flash[:success] = "Welcome Kayak pharmacy systems!"
      redirect_to pharmacist_path(@pharmacy)
    else
      render 'new'
    end

  end

  private

    def pharmacy_params
      params.require(:pharmacy).permit(:name, :pharmacy_name, :email, :region, :location, :address, :password,
                                   :password_confirmation)
    end
end
