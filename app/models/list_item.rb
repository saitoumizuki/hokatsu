class ListItem < ApplicationRecord
	include RankedModel
	ranks :row_order
	belongs_to :user
	belongs_to :nursery
end
