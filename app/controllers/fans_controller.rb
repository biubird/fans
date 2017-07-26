require 'fans_helper'

class FansController < ApplicationController
  attr_reader :fans, :markers

  def index
    @fans = Fan.all.order(:created_at).reverse_order
    @markers = CreateMarker.new(@fans).process
    @fan = Fan.new
    @left_marker_url = CreateMarkerUrl.new(@markers).left_post_initialize
    @right_marker_url = CreateMarkerUrl.new(@markers).right_post_initialize
  end

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.new(fan_params)
    if @fan.save
      redirect_to fans_url, notice: "Thanks for joining the BeauSoleil fanbase!"
    else
      render :new
    end
  end

  private

  def fan_params
    fan_params = params.require(:fan).permit(:name, :email, :city, :state, :country, :message)
  end
end






