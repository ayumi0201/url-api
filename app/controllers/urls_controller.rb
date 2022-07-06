class UrlsController < ApplicationController
  require 'securerandom'

  def register_url

    @original_url = Url.new(original_url: params["original_url"], short_url: SecureRandom.alphanumeric(5))
    if @original_url.save
      render json: { status: "success", url: @original_url }
    else
      render json: { status: "success", url: @original_url.errors }
    end
  end

  def original_url_list
    @original_url_list = Url.pluck(:original_url)
    render json: { status: "success", original_url_list: @original_url_list }
  end

  def original_url
    @original_url = Url.find_by(short_url: params["short_url"]).original_url
    render json: { status: "success", original_url: @original_url }
  end

end
