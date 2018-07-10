class Nursery < ApplicationRecord
	belongs_to :admin
	has_many :prices
	geocoded_by :address
	after_validation :geocode
end
