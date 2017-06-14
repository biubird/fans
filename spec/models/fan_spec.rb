require 'rails_helper'

describe "validating a fan" do
  it "requires a name" do
    fan = Fan.new(name: "")

    fan.valid?  # populates errors

    expect(fan.errors[:name].any?).to eq(true)
  end

  it "requires a valid email" do
    email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    fan = Fan.new(email: "")

    fan.valid?

    expect(fan.errors[:email].any?).to eq(true)
  end

  it "requires a city" do
    fan = Fan.new(city: "")

    fan.valid?

    expect(fan.errors[:city].any?).to eq(true)
  end

  it "requires a valid state" do
    states = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY]
    states.each do |state|
      fan = Fan.new(state: state)
      fan.valid?

      expect(fan.errors[:state].any?).to eq(false)
    end
  end
end
