require 'csv'

csv_text = ""

Dir[File.join(Rails.root, 'lib/csv', 'user', '*.csv')].each { |csv| csv_text << File.read(csv) }

csv = CSV.parse(csv_text, :headers => true)
csv.each_with_index do |row, index|
  t = User.new
  t.email = row['email']
  t.password = row['password']
  t.nickname = row['nickname']
  t.phone = row['phone']
  t.gender = row['gnerder']
  t.save
end
