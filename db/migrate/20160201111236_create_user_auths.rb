class CreateUserAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :user_auths, primary_key: 'user_auth_id' do |t|
      t.references :user, index: true, foreign_key: true
      t.string :access_token

      t.timestamps
    end
  end
end
