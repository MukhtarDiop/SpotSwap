class Spot < ApplicationRecord
  belongs_to :user
  CATEGORIES = ['storage', 'parking_space', 'garage']

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
