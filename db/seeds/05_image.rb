Dir[File.join(Rails.root, 'lib/image', 'store', '*.png')].each { |image|
  store_name = File.basename(image, '.png')
  @stores = Store.all.where('name LIKE ?', "%#{store_name}%")
  @stores.each do |store|
    @si = Image.new
    @si.image = File.new(image)
    @si.imageable = store
    @si.save!
  end
}

Dir[File.join(Rails.root, 'lib/image', 'store_menu', '*.png')].each { |image|
  store_name = File.basename(image, '.png').split('_')[0]
  @stores = Store.all.where('name LIKE ?', "%#{store_name}%")
  @stores.each do |store|
    @sm = StoreMenu.new
    @sm.store_id = store.store_id
    @sm.save!

    @si = Image.new
    @si.image = File.new(image)
    @si.imageable = @sm
    @si.save!
  end
}
