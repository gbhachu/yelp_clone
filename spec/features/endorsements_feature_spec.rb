require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user = User.create(email: 'test@test.com', password: 'password')
    kfc = Restaurant.create(name: 'KFC', user_id: user.id)
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination', user_id: user.id)
  end

  scenario 'a review has no endorsements' do
    visit '/restaurants'
    expect(page).to have_content('0 endorsements')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    user = User.create(email: 'steve@test.com', password: 'password')
    rest = Restaurant.create(name: 'Steve', user_id: user.id)
    review = rest.reviews.create(rating: 5, thoughts: 'Amazing place!!!', user_id: user.id)
    review.endorsements.create
    visit '/restaurants'
    click_link 'Endorse Review' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

end
