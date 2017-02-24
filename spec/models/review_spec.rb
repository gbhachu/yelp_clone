require 'rails_helper'

describe Review, type: :model do
  it "is invalid if the rating is more than 5" do
    Restaurant.create(name: 'KFC')
    User.create(email: 'test@test.com', password: '123456', password_confirmation: '123456')
    review = Review.new(rating: 10, user_id: 1, restaurant_id: 1)
    expect(review).to have(1).error_on(:rating)
  end

  
end
