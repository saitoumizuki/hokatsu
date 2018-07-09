class Nursery < ApplicationRecord
	belongs_to :admin
	has_many :prices
end
