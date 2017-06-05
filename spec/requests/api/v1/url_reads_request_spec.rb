require 'rails_helper'

describe "ReadUrls API" do
  context 'no errors -- ' do
    it 'will create a new url and read if the url does not exist' do
      params = {
        read: { user_id: 1 },
        url:  { address: "https://vimeo.com/198611383" },
      }

      expect(Url.count).to eq(0)

      post '/api/v1/read_urls', params: params

      expect(Url.count).to eq(1)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(body[:url]).to eq("https://vimeo.com/198611383")
    end

    it 'will only create a new read if the url does exist' do
      url = create(:url)
      params = {
        read: { user_id: 1 },
        url:  { address: url.address }
      }

      expect(Url.count).to eq(1)

      post '/api/v1/read_urls', params: params

      expect(Url.count).to eq(1)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(body[:url]).to eq(url.address)
    end
  end

  context 'errors -- ' do
    it 'will fail if the params are empty' do
      url = create(:url)
      params = {
        read: { user_id: nil },
        url:  { address: nil }
      }

      expect(Url.count).to eq(1)

      post '/api/v1/read_urls', params: params

      expect(Url.count).to eq(1)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(body[:error][0]).to eq("Address can't be blank")
    end

    it 'will fail if there is a duplicate read for a url & user' do
      url = create(:url)
      read = create(:read, url: url)
      params = {
        read: { user_id: read.user_id },
        url:  { address: url.address }
      }

      expect(Url.count).to eq(1)

      post '/api/v1/read_urls', params: params

      expect(Url.count).to eq(1)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(body[:error][0]).to eq("User HotRead already recorded")
    end
  end
end