class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  CATEGORIES = ['storage', 'parking_space', 'garage']

  validates :description, presence: true
  validates :latitude, presence: true
  validates :latitude, numericality: true
  validates :longitude, presence: true
  validates :longitude, numericality: true
  validates :length, presence: true
  validates :length, numericality: true
  validates :width, presence: true
  validates :width, numericality: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
