class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  validate :end_date_after_start_date
  validate :no_past_dates

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
end 