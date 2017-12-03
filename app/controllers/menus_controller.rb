class MenusController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.admin?
      @q = @menus.page(params[:page]).ransack(params[:q])
      @menus = @q.result
    else
      @q = current_user.menus.page(params[:page]).ransack(params[:q])
      @menus = @q.result
    end
  end

  def show
  end

  def new
    if params[:store_id]
      @menu = Store.find(params[:store_id]).menus.new
    end
    @menu.pictures.build
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def menu_params
      params.require(:menu).permit(:name, :intro, :price, :store_id,
                                   pictures_attributes: [:id, :name, :_destroy])
    end
end
