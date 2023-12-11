class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :find_item, only: [:show, :destroy]

  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

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
    if current_user == @item.user && @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to root_path, alert: '商品の削除に失敗しました'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :image)
  end
end