class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    # 商品一覧を表示する処理
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params) #Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      @item = Item.new 
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id,)
  end
end