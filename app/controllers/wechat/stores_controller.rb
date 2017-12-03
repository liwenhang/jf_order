class Wechat::StoresController < ApplicationController
  before_action :authenticate_user!

  layout 'wechat'

  def index
    @stores = Store.page(params[:page])
  end

  def show
    @store = Store.find params[:id]
  end
end