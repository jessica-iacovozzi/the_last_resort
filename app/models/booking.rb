class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spell

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
end
