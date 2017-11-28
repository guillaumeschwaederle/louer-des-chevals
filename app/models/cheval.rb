class Cheval < ApplicationRecord
  belongs_to :profile
  belongs_to :robe
  belongs_to :category

  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum:2500 }
  validates :address, presence: true
  validates :taille, presence: true

  has_many :profiles, through: :bookings
  has_many :reviews

end