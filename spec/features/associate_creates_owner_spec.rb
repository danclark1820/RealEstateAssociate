require 'spec_helper'

feature 'associate creates an owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  #Acceptance Criteria
  # * I must specify a first name, last name, and email address
  # * I can optionally specify a company name
  # * If I do not specify the required information, I am presented with errors
  # * If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  context 'with valid attributes' do
    it 'enters a new owner with valid attributes' do
      visit '/owners/new'

      fill_in "First name", with: "Greg"
      fill_in "Last name", with: "Sheppard"
      fill_in "Email",  with: "greg@example.com"
      click_on "Add owner"

      expect(page).to have_content("Succesfully added owner")
    end
  end

  context 'with invalid attributes' do
    it 'enters a new owner with incomplete attributes' do
      visit '/owners/new'

      click_on "Add owner"

      expect(page).to have_content("Please fill out required fields")
    end
  end
end
