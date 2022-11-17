class Spell < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :user, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_category_location_name_and_description,
                  against: %i[category location description name],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
