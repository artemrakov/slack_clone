require 'rails_helper'

RSpec.feature "Teams", type: :feature do
  let(:user) { create(:user) }

  scenario "creates a team" do
    sign_in_as user
    visit root_path

    click_link "My Teams"
    click_link "Create New Team"
    fill_in "Name", with: "Newteam"
    fill_in "Description", with: "description"
    click_button "Create Team"

    expect(page).to have_content "Newteam"
    expect(page).to have_content "description"
  end
end
