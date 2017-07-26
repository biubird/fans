require 'rails_helper'

describe "Creating a new fan" do
  it "saves the fan and shows the fan's message" do
    visit fans_url

    fill_in "Name", with: "Super Fan"
    fill_in "Email", with: "fan@super.com"
    fill_in "City", with: "Portland"
    select "OR", from: "State"
    select "USA", from: "Country"
    fill_in "Message", with: "I just love this band!"

    click_button 'Create Fan'

    expect(page).to have_text('Thanks for joining the BeauSoleil fanbase!')
    expect(page).to have_text("I just love this band!")
    expect(page).to have_text("Super Fan")
    expect(page).to have_text("Portland")
    expect(page).to have_text("OR")
    expect(page).to have_text("USA")
  end
  it "shows the location pin on map" do
    visit fans_url

    fill_in "Name", with: "Super Fan"
    fill_in "Email", with: "fan@super.com"
    fill_in "City", with: "Portland"
    select "OR", from: "State"
    select "USA", from: "Country"

    click_button 'Create Fan'

    expect(page).to have_content(@left_marker_url)
    expect(page).to have_content(@right_marker_url)
  end
end
