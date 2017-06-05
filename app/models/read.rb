class Read < ApplicationRecord
  belongs_to :url

  validates :user_id, :presence
end
