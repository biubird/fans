require 'rails_helper'

describe "Creating a new fan" do
  it "saves the fan and shows the fan's message" do
    visit fans_url

    fill_in "Name", with: "Super Fan"
    fill_in "Email", with: "fan@super.com"
    fill_in "City", with: "Portland"
    fill_in "State", with: "OR"
    fill_in "Country", with: "USA"
    fill_in "Message", with: "I just love this band!"

    click_button 'Create Fan'

    expect(page).to have_text('Thanks for joining the BeauSoleil fanbase!')
    expect(page).to have_text("I just love this band!")
  end
end
