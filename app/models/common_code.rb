class CommonCode < ApplicationRecord
  def self.find_by_code(main_code, detail_id)
    where(main_code: main_code).where(detail_id: detail_id).first.name_kor
  end
end
