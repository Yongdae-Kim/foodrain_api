class Region < ApplicationRecord
  scope :find_by_name, lambda { |name|
    where('dong LIKE ?', "%#{name}%") if name.present?
  }
end
