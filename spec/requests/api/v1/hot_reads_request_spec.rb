require 'rails_helper'

describe "HotReads API" do
  context 'no errors -- ' do
    it 'returns blank if the link is not hot' do
      urls = create_list(:url, 20)

      urls.each_with_index do |url, i|
        i.times do |id|
          create(:read, user_id: id + 1, url: url)
        end
      end

      get "/api/v1/hot_reads?address=#{urls[5].address}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(body[:rank]).to eq("")
    end

    it 'returns if the link is hot' do
      urls = create_list(:url, 20)

      urls.each_with_index do |url, i|
        i.times do |id|
          create(:read, user_id: id + 1, url: url)
        end
      end

      get "/api/v1/hot_reads?address=#{urls[15].address}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(body[:rank]).to eq("hot")
    end

    it 'returns if the link is top' do
      urls = create_list(:url, 20)

      urls.each_with_index do |url, i|
        i.times do |id|
          create(:read, user_id: id + 1, url: url)
        end
      end

      get "/api/v1/hot_reads?address=#{urls[19].address}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(body[:rank]).to eq("top")
    end
  end

  context 'errors --' do
    it 'returns an error if no query' do
      get "/api/v1/hot_reads"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(body[:error]).to eq("Url address not specified")
    end

    it 'returns an error if url is not in the database' do
      url = build(:url)

      get "/api/v1/hot_reads?address=#{url.address}"

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(body[:error]).to eq("Url not found")
    end
  end
end
