class CreateStoreOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :store_owners, primary_key: 'store_owner_id' do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
