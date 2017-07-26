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

  it "requires a valid city" do
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

  it "requires a valid country" do 
    countries = %w[USA Afghanistan Albania Algeria Andorra Angola Antiqua/Barbuda Argentina Armenia Aruba Australia Azerbaijan Bahamas Bahrain Bangladesh Barbados Belarus 
                 Belgium Belize Benin Bhutan Bolivia Bosnia/Herzegovina Botswana Brazil Brunei Bulgaria BurkinaFaso Burma Burundi Cambodia Cameroon Canada CaboVerde Central/African/Republic 
                 Chad Chile China Colombia Comoros Congo CostaRica Coted'Ivoire Croatia Cuba Curacao Cyprus Czechia Denmark Djibouti Dominica DominicanRepublic EastTimor Ecuador 
                 Egypt ElSalvador EquatorialGuinea Eritrea Estonia Ethiopia Fiji Finland France Gabon Gambia Georgia Germany Ghana Greece Grenada Guatemala Guinea Guinea-Bissau
                 Guyana Haiti Holy-See Honduras HongKong Hungary Iceland India Indonesia Iran Iraq Ireland Israel Italy Jamaica Japan Jordan Kazakhstan Kenya Kiribati Korea-North
                 Korea-South Kosovo Kuwait Kyrgyzstan Laos Latvia Lebanon Lesotho Liberia Libya Liechtenstein Lithuania Luxembourg Macau Macedonia Madagascar Malawi Malaysia
                 Maldives Mali Malta MarshallIslands Mauritania Mauritius Mexico Micronesia Moldova Monaco Mongolia Montenegro Morocco Mozambique Namibia Nauru Nepal Netherlands
                 NewZealand Nicaragua Niger Nigeria Norway Oman Pakistan Palau PalestinianTerritories Panama PapuaNewGuinea Paraguay Peru Philippines Poland Portugal Qatar
                 Romania Russia Rwanda SaintKitts/Nevis SaintLucia SaintMaarten SaintVincent/Grenadines Samoa SanMarino SaoTome/Principe SaudiArabia Senegal Serbia Seychelles SierraLeone
                 Singapore Slovakia Slovenia SolomonIslands Somalia SouthAfrica Sudan Spain SriLanka Suriname Swaziland Sweden Switzerland Syria Taiwan Tajikistan Tanzania
                 Thailand Timor-Leste Togo Tonga Trinidad/Tobago Tunisia Turkey Turkmenistan Tuvalu Uganda Ukraine UnitedArabEmirates UnitedKingdom Uruguay Uzbekistan Vanuatu
                 Venezuela Vietnam Yemen Zambia Zimbabwe]
    countries.each do |country|
      fan = Fan.new(country: country)
      fan.valid?

      expect(fan.errors[:country].any?).to eq(false)
    end
  end
end
