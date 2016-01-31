require 'csv'

csv_text = ""

Dir[File.join(Rails.root, 'lib/csv', 'store', '*.csv')].each { |csv| csv_text << File.read(csv) }

csv = CSV.parse(csv_text, :headers => true)
csv.each_with_index do |row, index|
  t = Store.new
  t.store_owner_id = index + 1
  t.category_id = row['category_id']
  t.name = row['name']
  t.phone = row['phone']
  t.address = row['address']
  t.latitude = row['latitude']
  t.longitude = row['longitude']
  t.detail = row['detail']
  t.save
end
