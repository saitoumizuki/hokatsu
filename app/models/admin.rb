class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :nurseries

	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :email, presence: true
end
