class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many_attached :photos
  CATEGORIES = ['storage', 'parking', 'garage']

  validates :description, presence: true, length: { maximum: 120 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :length, presence: true
  validates :length, numericality: true
  validates :width, presence: true
  validates :width, numericality: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
