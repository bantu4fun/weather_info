class City < ActiveRecord::Base

  validates :city_name, presence: true
  validates :country, presence: true

end
