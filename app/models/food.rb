class Food < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  validates :name, :expiration_date, presence: true
  validates :category, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
