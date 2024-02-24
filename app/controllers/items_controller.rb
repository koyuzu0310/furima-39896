class ItemsController < ApplicationController

 before_action :authenticate_user!, except: [:index, :show,]
 before_action :move_to_index, except: [:index, :show]

 def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end
 
 def edit
  @item = Item.find(params[:id])
end


def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to root_path, notice: "アイテムが更新されました"
  else
    render :edit, status: :unprocessable_entity
  end
end


 def show
  @item = Item.find(params[:id])
 end

 def index
  @items = Item.order(created_at: :desc)
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
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
      :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
end
end


