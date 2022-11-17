class Spell < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :category, acceptance: { accept: ['home', 'self', 'love', 'social', 'family', 'career'] }
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
