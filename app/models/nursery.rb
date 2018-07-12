class Nursery < ApplicationRecord
	belongs_to :admin
	has_many :prices, dependent: :destroy
	accepts_nested_attributes_for :prices, allow_destroy: true, reject_if: :all_blank
	attachment :image
	geocoded_by :address
	after_validation :geocode

	# before_save :geocode_full_address

	# def geocode_full_address
	# coords = Geocoder.coordinates(self.address)
	# self.latitude = coords[0]
	# self.longitude = coords[1]
	# end
end
