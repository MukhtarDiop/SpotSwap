class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  CATEGORIES = ['storage', 'parking', 'garage']

  validates :description, presence: true, length: { maximum: 120 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :length, presence: true, numericality: { 
    greater_than: 0, message: "cannot be zero or negative"
  }

  validates :width, presence: true, numericality: { 
    greater_than: 0, message: "cannot be zero or negative"
  }

  validates :height, numericality: { 
    greater_than: 0, message: "cannot be negative"
  }, allow_nil: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :rate, presence: true, numericality: { 
    greater_than: 0, message: "cannot be zero or negative"
  }
  validates :rate, numericality: { 
    less_than_or_equal_to: 30, message: "cannot be over $30"
  }

  def city
    if address.present?
      Geocoder.search(address).first&.city
    elsif latitude.present? && longitude.present?
      Geocoder.search([latitude, longitude]).first&.city
    end
  end
end
