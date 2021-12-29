class PurchaseRecordsController < ApplicationController

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end 

  def create
    @purchase_form = PurchaseForm.new(purchase_record_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end    

  private

  def purchase_record_params
    params.require(:purchase_form).permit(:postal_code, :ship_form_id, :city, :house_number, :building_name, 
      :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end