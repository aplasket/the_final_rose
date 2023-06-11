class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings
end
