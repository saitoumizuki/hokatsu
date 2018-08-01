class Spot < ApplicationRecord
	belongs_to :user
	geocoded_by :address
  	after_validation :geocode
	validates :name, presence: true
  	validates :post_code, length: { maximum: 7 }, format: { with: /\A[a-z0-9]+\z/i }
end
