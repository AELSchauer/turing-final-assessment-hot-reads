require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:address) }
  it { should have_many(:reads) }

  it '#self.top_links' do
    urls = create_list(:url, 20)

    urls.each_with_index do |url, i|
      i.times do |id|
        create(:read, user_id: id + 1, url: url)
        create(:read, user_id: id + 21, url: url, created_at: Time.new - (60 * 60 * 24 * 2))
      end
    end

    ten = Url.top_links

    expect(ten.count).to eq(10)
    expect(ten.first.id).to eq(20)
    expect(ten.last.id).to eq(11)
  end

  it '#hot?' do
    urls = create_list(:url, 20)

    urls.each_with_index do |url, i|
      i.times do |id|
        create(:read, user_id: id + 1, url: url)
        create(:read, user_id: id + 21, url: url, created_at: Time.new - (60 * 60 * 24 * 2))
      end
    end

    url_1 = urls[0]
    url_2 = urls[10]
    url_3 = urls[19]

    expect(url_1.hot?).to eq("")
    expect(url_2.hot?).to eq("hot")
    expect(url_3.hot?).to eq("top")
  end
end
