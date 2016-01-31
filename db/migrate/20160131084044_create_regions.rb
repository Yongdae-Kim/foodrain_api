class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :do
      t.string :gu
      t.string :dong
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
