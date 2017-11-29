class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :cheval

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :statut, presence: true
  validates :message, presence: true, length: { maximum:300 }

  validates_presence_of :end_date, if: :temporalite?

  def temporalite?
    end_date > start_date
  end
end
