class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  validate :end_date_after_start_date
  validate :no_past_dates
  validate :dates_available

  # Returns the number of nights for the booking (excluding checkout date)
  def nights
    return 0 if start_date.blank? || end_date.blank?
    (end_date.to_date - start_date.to_date).to_i
  end

  # Returns the total price for the booking
  def total_price
    return 0 unless spot && spot.rate && nights.positive?
    spot.rate.to_f * nights
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
    end
  end

  def no_past_dates
    return if start_date.blank?
    if start_date < Date.current
      errors.add(:start_date, "can't be in the past")
    end
  end

  def dates_available
    return if start_date.blank? || end_date.blank? || spot.blank?
    overlapping = Booking.where(spot_id: spot_id)
      .where.not(id: id)
      .where("start_date < ? AND end_date > ?", end_date, start_date)
    if overlapping.exists?
      errors.add(:base, "The selected dates are not available for this spot.")
    end
  end
end 