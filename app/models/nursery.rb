class Nursery < ApplicationRecord
	belongs_to :admin
	has_many :prices, dependent: :destroy
	accepts_nested_attributes_for :prices, allow_destroy: true, reject_if: :all_blank
	geocoded_by :address
	after_validation :geocode
end
