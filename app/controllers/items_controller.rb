class ItemsController < ApplicationController
  def items_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :tem_scheduled_delivery_id, :item_price, :price).merge(user: current_user.id)
 end
 
 def message_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
end
