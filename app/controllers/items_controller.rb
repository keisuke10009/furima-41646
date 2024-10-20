class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_from_id, only: [:show, :edit, :update, :destroy]
  before_action :purchase_from_id, only: [:show, :edit]
  def index
    @items = Item.all.order(created_at: :desc)
    @purchases = Purchase.all
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
    return unless @purchase.length != 0

    redirect_to action: :index
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
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
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

  def purchase_from_id
    @purchase = Purchase.all.where(item_id: params[:id])
  end
end
