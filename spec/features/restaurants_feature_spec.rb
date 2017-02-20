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

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restuarants' do
    let!(:kfc){Restaurant.create(name: 'KFC')}

    scenario 'lets a user view a description of a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content('KFC')
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end
end
