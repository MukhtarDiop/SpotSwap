class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  enum status: {
    pending: 0,
    approved: 1,
    declined: 2
  }, _default: :pending

  before_validation :set_default_status, on: :create

  private

  def set_default_status
    self.status ||= :pending
  end
end 