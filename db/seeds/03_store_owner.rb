require 'csv'

csv_text = ""

Dir[File.join(Rails.root, 'lib/csv', 'store_owner', '*.csv')].each { |csv| csv_text << File.read(csv) }

csv = CSV.parse(csv_text, :headers => true)
csv.each_with_index do |row, index|
  t = StoreOwner.new
  t.email = row['email']
  t.password = row['password']
  t.name = row['name']
  t.phone = row['phone']
  t.save
end
