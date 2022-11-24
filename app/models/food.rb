class Food < ApplicationRecord
  CATEGORIES = ["Fruit/Vegetable", "Meal", "Sandwich", "Meat", "Drink", "Soup"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, :expiration_date, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  multisearchable against: [:name, :category]

end
