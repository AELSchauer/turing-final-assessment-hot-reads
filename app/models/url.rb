class Url < ApplicationRecord
  has_many :reads

  validates :name, :presence
end
