class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offering

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :details, presence: true, length: { minimum: 20 }
end
