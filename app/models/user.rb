class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :spots, dependent: :delete_all
        has_many :list_items,dependent: :delete_all
        has_one :memo, dependent: :delete

        geocoded_by :address
  		after_validation :geocode
  		validates :name, presence: true
  		validates :post_code, length: { maximum: 7 }, format: { with: /\A[a-z0-9]+\z/i }
end
