class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    item_from_id
  end

  def edit
    if current_user.id == Item.find(params[:id]).user_id
      item_from_id
    else
      redirect_to action: :index
    end
  end

  def update
    item_from_id
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_charge_id, :area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_from_id
    @item = Item.find(params[:id])
  end
end
