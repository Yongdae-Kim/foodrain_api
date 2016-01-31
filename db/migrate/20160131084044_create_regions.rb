class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions, primary_key: 'region_id' do |t|
      t.string :do
      t.string :gu
      t.string :dong
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
