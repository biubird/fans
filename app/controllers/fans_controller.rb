class FansController < ApplicationController
  def index
    @fans = Fan.all.order(:created_at).reverse_order
    @fan = Fan.new
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
