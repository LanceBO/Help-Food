class Food < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :expiration_date, presence: true
  validates :category, presence: true
end
