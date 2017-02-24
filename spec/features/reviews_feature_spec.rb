require 'rails_helper'

feature 'reviewing' do
  # before { Restaurant.create name: 'KFC' }
  before do
    create_restaurant
    click_link "Sign out"
  end
  scenario 'allows users to leave a review using a form' do
    visit('/restaurants')
    click_link('Sign up')
    fill_in("Email", with: "dave@dave.com")
    fill_in("Password", with: "123456789")
    fill_in("Password confirmation", with: "123456789")
    click_button("Sign up")

    click_link 'Review KFC'
    fill_in "Thoughts", with: "you call that chicken?"
    select '2', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('you call that chicken?')
  end

#   def leave_review(thoughts, rating)
#   visit '/restaurants'
#   click_link 'Review KFC'
#   fill_in 'Thoughts', with: thoughts
#   select rating, from: 'Rating'
#   click_button 'Leave Review'
# end


  scenario 'displays an average rating for all reviews' do

    visit('/restaurants')
  	click_link('Sign up')
  	fill_in("Email", with: "steve@example.com")
  	fill_in("Password", with: "123456789")
  	fill_in("Password confirmation", with: "123456789")
    click_button("Sign up")
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Great"
    select '4', from: 'Rating'
    click_button 'Leave Review'
  expect(page).to have_content('Average rating: ★★★★☆')

end


end
