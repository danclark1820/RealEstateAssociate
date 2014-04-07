require "spec_helper"

feature 'create a building', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

#Acceptance Criteria:
# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format, the building is recorded.
# * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# * Upon successfully creating a building, I am redirected so that I can record another building.

  context 'with valid attributes' do
    it 'creates a building' do
      visit new_building_path

      fill_in "Address", with: "11 street way"
      fill_in "City", with: "Boston"
      fill_in "State", with: 'MA'
      fill_in "Zip", with: "01921"
      click_on "Add building"

      expect(page).to have_content("Successfully added building")
    end
  end

  context "with invalid input" do
    it 'does not create a building' do
      visit new_building_path

      fill_in "Address", with: "11 street way"
      fill_in "City", with: "Boston"
      fill_in "State", with: "mass"
      fill_in "Zip", with: "11211"
      click_on "Add building"

      expect(page).to have_content("Please fill out required fields")
    end
  end
end
