class Offering < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :instrument, presence: true
  validates :availability, presence: true
  validates :price, presence: true
end
