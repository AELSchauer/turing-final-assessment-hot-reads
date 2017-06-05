class HotReadsController < ApplicationController
  def index
    @urls = Url.top_links
  end
end
