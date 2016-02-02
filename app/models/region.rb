class Region < ApplicationRecord
  def self.find_by_name(name)
    where('dong LIKE ?', "%#{name}%") if name.present?
  end
end
