class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :spots, dependent: :delete_all
        has_many :list_items,dependent: :delete_all
        has_one :memo, dependent: :delete
        has_many :task, dependent: :delete_all
        has_many :checked_task, dependent: :delete_all
end
