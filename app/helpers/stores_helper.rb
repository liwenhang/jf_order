module StoresHelper
  def stores_for_roles
    if current_user.admin?
      @stores = Store.all
    else
      @stores = current_user.stores
    end
  end
end
