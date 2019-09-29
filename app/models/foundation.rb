class Foundation < ApplicationRecord
  belongs_to :guru
  validates_presence_of :brand, :shade, :group
end
