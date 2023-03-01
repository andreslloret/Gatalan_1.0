class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :date, presence: true
end