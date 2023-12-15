class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create, :edit]
  before_action :user_is_seller?, only: [:index, :create]
  before_action :item_sold_out?, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new 
  end

  
  def create
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

  def find_item
    @item =  Item.find(params[:item_id] || params[:id])
  end

  def user_is_seller?
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_sold_out?
    if @item.order != nil
      redirect_to root_path, alert: "This item is sold out and cannot be edited."
    end
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