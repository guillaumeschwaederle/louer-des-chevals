class Cheval < ApplicationRecord
  belongs_to :profile
  belongs_to :robe
  belongs_to :category
end
