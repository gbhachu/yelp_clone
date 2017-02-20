require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants added' do
    scenario 'should display a link to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content('No restaurants added yet')
      expect(page).to have_link('Add a restaurant')
    end
  end
end
