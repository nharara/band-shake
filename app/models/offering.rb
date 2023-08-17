class Offering < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :instrument, presence: true
  validates :availability, presence: true
  validates :price, presence: true
  before_create :change_url

  def change_url
    self.url = url.gsub(/watch\?v=/, 'embed/')
  end
end
