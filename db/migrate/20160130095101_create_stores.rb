class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores, primary_key: 'store_id' do |t|
      t.references :store_owner, index: true, foreign_key: true
      t.integer :category_id
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :phone
      t.text :detail
      t.time :start_time
      t.time :end_time
      t.string :holiday
      t.integer :reviews_count, default: 0

      t.timestamps
    end
  end
end
