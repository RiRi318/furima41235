class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
         @order_address.save
         redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private
    def order_params
      params.require(:order_address).permit(:postal_code, :region_id, :region_city, :street_address, :building_name, :call).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end