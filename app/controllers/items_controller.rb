class ItemsController < ApplicationController
   before_action :set_item, except: [:index, :new, :create]

  def index
     @items = Item.all
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

  private

  def set_item
    @item = Item.find(params[:id])
  end  
end
