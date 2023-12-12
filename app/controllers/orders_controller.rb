class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(donation_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :address, :building_name, :price).merge(user_id: current_user.id)
  end
end