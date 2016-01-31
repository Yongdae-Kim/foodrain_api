require 'csv'

csv_text = ""

Dir[File.join(Rails.root, 'lib/csv', 'review', '*.csv')].each { |csv| csv_text << File.read(csv) }

csv = CSV.parse(csv_text, :headers => true)
csv.each_with_index do |row, index|
  t = Review.new
  t.store_id = row['store_id']
  t.user_id = row['user_id']
  t.detail = row['detail']
  t.grade = row['grade']
  t.save
end
