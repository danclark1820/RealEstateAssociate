require "spec_helper"

feature 'create a building with owner', %q{
As a real estate associate
I want to correlate an owner with buildings
So that I can refer back to pertinent information
} do

#Acceptance Criteria
# When recording a building, I want to optionally associate the building with its rightful owner.
# If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  context 'with valid attributes' do
    it 'creates a building' do
      owner = Owner.create(first_name:"Dan", last_name:"Clark", email:"dan@clark.com")
      visit new_building_path

      fill_in "Address", with: "11 street way"
      fill_in "City", with: "Boston"
      fill_in "State", with: 'MA'
      fill_in "Zip", with: "01921"
      select "Dan Clark", from: "Owner"
      click_on "Add building"

      expect(page).to have_content("Successfully added building")
    end
  end
end
