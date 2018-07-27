class ListItem < ApplicationRecord
	belongs_to :user
	belongs_to :nursery
	has_one :list_memo, dependent: :delete
end
