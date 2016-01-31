class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews, primary_key: 'review_id' do |t|
      t.references :store, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :detail
      t.float :grade

      t.timestamps
    end
  end
end
