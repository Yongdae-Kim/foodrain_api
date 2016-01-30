class CreateCommonCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :common_codes, primary_key: 'common_code_id' do |t|
      t.string :main_code
      t.integer :detail_code_id
      t.string :name_kor

      t.timestamps
    end
  end
end
