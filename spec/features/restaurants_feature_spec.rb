require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants added' do
    scenario 'should display a link to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content('No restaurants added yet')
      expect(page).to have_link('Add a restaurant')
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants added yet')
    end
  end
end
