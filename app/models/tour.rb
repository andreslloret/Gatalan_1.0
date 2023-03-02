class Tour < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :date, presence: true
  has_one_attached :image
end
