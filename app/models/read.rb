class Read < ApplicationRecord
  belongs_to :url

  validates :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :url_id, message: 'HotRead already recorded'
end
