class FansController < ApplicationController
  def index
    @fans = Fan.all
    @fan = Fan.new
  end
  def create
    fan_params = params.require(:fan).permit(:name, :email, :city, :state, :country, :message)
    @fan = Fan.new(fan_params)
    @fan.save
    redirect_to fans_url, notice: "Thanks for joining the BeauSoleil fanbase!"
  end
end
