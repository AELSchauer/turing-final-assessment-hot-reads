class Api::V1::HotReadsController < ApplicationController
  def index
    url = Url.find_by(url_params)
    if url
      render json: { rank: url.hot? }, status: 201
    else
      render json: { error: "Url Not Found" }, status: :bad_request
    end
  end

  def url_params
    params.permit(:address)
  end
end
