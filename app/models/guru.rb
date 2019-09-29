class Guru < ApplicationRecord
  has_many :foundations
  validates_presence_of :blog, :group
end
