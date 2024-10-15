class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_from_id, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
    return unless current_user.id != @item.user_id

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless current_user.id == @item.user_id

    @item.destroy
    redirect_to root_path
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
