class Cheval < ApplicationRecord
  belongs_to :profile
  belongs_to :robe
  belongs_to :category

  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum:2500 }
  validates :taille, presence: true


  has_many :profiles, through: :bookings
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :rue_changed?


  def address
    self.rue + " " + self.ville
  end
  
  mount_uploader :photo, PhotoUploader
end
