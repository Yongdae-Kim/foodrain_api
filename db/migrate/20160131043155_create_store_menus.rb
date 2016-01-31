class CreateStoreMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :store_menus, primary_key: 'store_menu_id' do |t|
      t.references :store, index: true, foreign_key: true

      t.timestamps
    end
  end
end
