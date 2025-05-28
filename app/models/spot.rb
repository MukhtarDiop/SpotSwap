class Spot < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  CATEGORIES = ['storage', 'parking', 'garage']

  validates :description, presence: true
  validates :lat, presence: true
  validates :lat, numericality: true
  validates :long, presence: true
  validates :long, numericality: true
  validates :length, presence: true
  validates :length, numericality: true
  validates :width, presence: true
  validates :width, numericality: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
