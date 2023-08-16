class Offering < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :instrument, presence: true
  validates :availability, presence: true
  validates :price, presence: true
end
