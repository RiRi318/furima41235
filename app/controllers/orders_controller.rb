class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :seller_to_root
  before_action :soldout_to_root
  before_action :set_key

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
         @order_address.save
         redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
    def order_params
      params.require(:order_address).permit(:postal_code, :region_id, :region_city, :street_address, :building_name, :call).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
    end

    def seller_to_root
      redirect_to root_path if current_user.id == @item.user.id
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def set_key
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    end

    def soldout_to_root
      redirect_to root_path if @item.order.present?
    end
end