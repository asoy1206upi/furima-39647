class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # 商品一覧を表示する処理
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: '商品を出品しました'
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :user_id)
  end
end