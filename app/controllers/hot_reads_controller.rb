class Api::V1::HotReadsController < ApplicationController
  def index
    @urls = Url.top_links
  end
end
