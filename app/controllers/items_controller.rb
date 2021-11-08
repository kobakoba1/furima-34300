class ItemsController < ApplicationController
   before_action :set_item, except: [:index, :new, :create, :update]
   before_action :authenticate_user!, except: [:index, :show, :edit, :update]

  def index
     @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
     render :new
    end
  end  
  
  def show
  end  

  def edit
  end  

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end  

  private

  def item_params
    params.require(:item).permit(:price, :title, :concept, :category_id, :item_condition_id, :delivery_fee_id, :ship_form_id, :until_ship_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  
end
