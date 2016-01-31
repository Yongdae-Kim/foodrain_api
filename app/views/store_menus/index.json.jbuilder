json.array!(@store_menus) do |store_menu|
  json.extract! store_menu, :id, :store_id
  json.url store_menu_url(store_menu, format: :json)
end
