class CommonCode < ApplicationRecord
  def self.find_by_category(category_id)
    find_by_code('CATEGORY', category_id)
  end

  def self.find_by_gender(gender_id)
    find_by_code('GENDER', gender_id)
  end

  def self.find_by_code(main_code, detail_id)
    find_by_main_code(main_code).find_by_detail_id(detail_id)
  end

  def self.find_by_main_code(main_code)
    where(main_code: main_code)
  end

  def self.find_by_detail_id(detail_id)
    where(detail_id: detail_id)
  end
end
