class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update]
  before_action :item_sold_out?, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
    render :new, status: :unprocessable_entity
    end
  end 

  def show
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    if current_user == @item.user 
      @item.destroy
    end

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :image)
  end
  
  def find_item
    @item = Item.find(params[:id])
  end

  def authorize_user!
    unless current_user == @item.user
      redirect_to root_path, alert: '商品の編集権限がありません'
    end
  end

  def item_sold_out?
    if @item.order.present?
      redirect_to root_path
    end
  end
end