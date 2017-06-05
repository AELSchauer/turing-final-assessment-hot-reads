class Api::V1::HotReadsController < ApplicationController
  def index
    if url_params.empty?
      render json: { error: "Url address not specified" }, status: :bad_request
    else
      url = Url.find_by(url_params)
      if url.nil?
        render json: { error: "Url not found" }, status: :bad_request
      else
        render json: { rank: url.hot? }, status: 201
      end
    end
  end

  def url_params
    params.permit(:address)
  end
end
