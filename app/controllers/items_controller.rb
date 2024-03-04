class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_item, only: [:edit,:show,:update, :destroy]
 before_action :contributor_confirmation, only: [:edit, :update]
 
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

def show
end

  def edit
    if ! @item.order.nil?
      #current_user != @item.user || ! @item.order.nil?
      redirect_to root_path
    end
  end



 def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  if @item.destroy
    redirect_to root_path
else
  render :show
  end
end

private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
      :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def contributor_confirmation
set_item
  redirect_to action: :index unless current_user == @item&.user
end
end
