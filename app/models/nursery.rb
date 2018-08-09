class Nursery < ApplicationRecord
	belongs_to :admin
	has_many :prices, dependent: :destroy
	accepts_nested_attributes_for :prices, allow_destroy: true, reject_if: :all_blank
	geocoded_by :address
	after_validation :geocode
	validates :name, presence: true
	# validates :post_code, length: { maximum: 7 }, format: { with: /\A[a-z0-9]+\z/i }
	validates :phone, length: { maximum: 4 }
	validates :phone_middle, length: { maximum: 4 }
	validates :phone_right, length: { maximum: 4 }
end
