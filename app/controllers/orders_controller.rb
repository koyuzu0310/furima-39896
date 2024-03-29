class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]
  before_action :if_soldout, only: [:index, :create]

  def index
   gon.public_key = ENV["PAYJP_PUBLIC_KEY"]

   @orderform = OrderForm.new
end

def create

  @orderform = OrderForm.new(order_params)
  if @orderform.valid?
    pay_item #決済処理内容
    @orderform.save
    return redirect_to root_path
  else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render 'index', status: :unprocessable_entity
  end
end

    
  private
        def order_params
            params.require(:order_form).permit(:postal_code, :item_prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
        end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def if_soldout
    redirect_to root_path if @item.user_id == current_user.id || ! @item.order.nil?
  end


  def pay_item #決済処理内容
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.item_price,  
        card: order_params[:token], 
        currency: 'jpy'
      )
    end
  end



