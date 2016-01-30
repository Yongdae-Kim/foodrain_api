class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, primary_key: 'user_id' do |t|
      t.string :email
      t.string :password
      t.string :nickname
      t.string :phone
      t.integer :gender

      t.timestamps
    end
  end
end
