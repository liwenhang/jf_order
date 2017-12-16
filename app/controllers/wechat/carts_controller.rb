class Wechat::CartsController < ApplicationController

  def add
    menu = Menu.find_by(id: params[:id])
    store_cart = "store#{menu.store_id}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
    @cart.add_item(menu.id)
    session[store_cart.to_sym] = @cart.serialize
    redirect_to wechat_store_url(menu.store_id)
  end

  def plus
    menu = Menu.find_by(id: params[:id])
    store_cart = "store#{menu.store_id}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
    @cart.add_item(menu.id)
    session[store_cart.to_sym] = @cart.serialize
    redirect_to wechat_cart_url(store_id: menu.store_id)
  end

  def minus
    menu = Menu.find_by(id: params[:id])
    store_cart = "store#{menu.store_id}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
    @cart.remove_item(menu.id)
    session[store_cart.to_sym] = @cart.serialize

    redirect_to wechat_cart_url(store_id: menu.store_id)
  end

  def show
    store_cart = "store#{params[:store_id]}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
  end
end

