class Wechat::CartsController < ApplicationController
  layout 'wechat'

  def add
    menu = Menu.find_by(id: params[:id])
    store_cart = "store#{menu.store_id}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
    @cart.add_item(menu.id)
    session[store_cart.to_sym] = @cart.serialize
    redirect_to wechat_store_url(menu.store_id)
  end

  def show
    store_cart = "store#{params[:store_id]}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
  end

  def destroy
  end
end

