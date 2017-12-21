class Wechat::StoresController < Wechat::BaseController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find params[:id]
    store_cart = "store#{@store.id}"
    @cart = Cart.from_hash(session[store_cart.to_sym])
  end
end
