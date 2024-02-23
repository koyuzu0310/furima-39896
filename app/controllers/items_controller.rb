class ItemsController < ApplicationController

 before_action :authenticate_user!, except: [:index, :show]

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

 
#今回の機能ではまだ使わないためこの状態にする
 #def edit
  #@item = Item.find(params[:id])
#end
end