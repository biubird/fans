class Fan < ApplicationRecord

  validates :name, :city, presence: true

  STATES = %w(-- AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
  validates :state, inclusion: { in: STATES }
  COUNTRIES = %w(USA Afghanistan Albania Algeria Andorra Angola Antiqua/Barbuda Argentina Armenia Aruba Australia Azerbaijan Bahamas Bahrain Bangladesh Barbados Belarus 
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
                 Venezuela Vietnam Yemen Zambia Zimbabwe)
	validates :country, inclusion: { in: COUNTRIES }
  validates :message, length: { maximum: 150 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
