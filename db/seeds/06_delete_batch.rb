Store.all.each do |store|
  if store.images.blank?
    @store_menus = store.store_menus
    if @store_menus.present?
      @store_menus.each do |menu|
        menu.image.destroy
      end
      @store_menus.destroy_all
    end
    store.destroy
  end
end

StoreMenu.all.each do |menu|
  if menu.image.present?
    @store = menu.store
    if @store.images.blank?
      @store.destroy
      menu.destroy
    end
  end
end
