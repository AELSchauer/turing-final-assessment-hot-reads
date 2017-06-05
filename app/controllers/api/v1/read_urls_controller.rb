class Api::V1::ReadUrlsController < ApplicationController
  def create
    url = Url.find_or_create_by(url_params)
    if url.save
      read = url.reads.new(read_params)
      if read.save
        render json: { url: url.address }, status: 201
      else
        render json: { error: read.errors.full_messages }, status: :bad_request
      end
    else
      render json: { error: url.errors.full_messages }, status: :bad_request
    end
  end

  private

  def url_params
    params.require(:url).permit(:address)
  end

  def read_params
    params.require(:read).permit(:user_id)
  end
end
