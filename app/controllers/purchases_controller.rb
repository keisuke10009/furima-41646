class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase = Purchase.find_by(item_id: params[:item_id])
    if @purchase.nil?
      @item = Item.find(params[:item_id])
      @purchase_shipping = PurchaseShipping.new
      redirect_to root_path if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_params
    params.require(:purchase_shipping).permit(:item_id, :zip, :area_id, :city, :street_address, :building_name,
                                              :telephone_number, :purchase_id).merge({ user_id: current_user.id,
                                                                                       price: @item.price, token: params[:token] })
  end
end
