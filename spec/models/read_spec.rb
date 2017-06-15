require 'rails_helper'

RSpec.describe Read, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:url_id).with_message('HotRead already recorded') }

  it { should belong_to(:url) }
end
