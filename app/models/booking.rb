class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :food
  #has_many :foods, dependent: :destroy
end
