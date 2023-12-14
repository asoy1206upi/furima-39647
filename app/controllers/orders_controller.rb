class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    redirect_to root_path if user_is_seller?(@item)
    #redirect_to root_path if current_user.id == @item.user_id
  end

  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_is_seller?(item)
    user_signed_in? && current_user.id == item.user_id
  end


  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :phone_number, :address, :building).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

   def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end