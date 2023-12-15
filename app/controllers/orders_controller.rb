class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create, :edit]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new

    if user_is_seller?(@item) || (user_signed_in? && item_sold_out?(@item))
      redirect_to root_path
    end
  end

  
  def create
    @order_address = OrderAddress.new(order_params)

    if item_sold_out?(@item)
      redirect_to root_path, alert: "This item is sold out and cannot be purchased."
    elsif @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find

    if item_sold_out?(@item)
      redirect_to root_path, alert: "This item is sold out and cannot be edited."
    else
    end
  end


  private

  def find_item
    Item.find(params[:item_id] || params[:id])
  end

  def user_is_seller?(item)
    user_signed_in? && current_user.id == item.user_id
  end

  def item_sold_out?(item)
    item.order
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