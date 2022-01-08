class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end 

  def create
    @purchase_form = PurchaseForm.new(purchase_record_params)
    @item = Item.find(params[:item_id])
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end    

  private

  def purchase_record_params
    params.require(:purchase_form).permit(:postal_code, :ship_form_id, :city, :house_number, :building_name, 
      :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
  end


  def prevent_url
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    end
  end    
end