class Food < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  validates :name, :expiration_date, presence: :true
  validates :category, presence: :true
end
