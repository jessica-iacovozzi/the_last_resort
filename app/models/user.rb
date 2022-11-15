class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spells, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :first_name, :last_name, :address, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
