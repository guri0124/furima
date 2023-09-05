class ItemsController < ApplicationController
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
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
  params.require(:item).permit(:item_name, :caption, :category_id, :condition_id, :postage_id, :region_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

end
