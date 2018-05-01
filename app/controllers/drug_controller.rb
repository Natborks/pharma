class DrugController < ApplicationController
  def create
  @drug = Drug.new(drug_params)
  @drug.pharmacy_id = params[:pharmacy_id]

  @drug.save

  redirect_to pharmacy_path(@drug.pharmacy)
end

def comment_params
  params.require(:drug).permit(:name, :quantity)
end

end
