class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :cheval
  
  validates_numericality_of :rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5, default: 0, presence: true
  validates :content, length: { maximum: 150 }
end


