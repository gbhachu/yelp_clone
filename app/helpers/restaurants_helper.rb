module RestaurantsHelper

def getReviews(restaurant_id)
  @reviews = Review.where(:restaurant_id => restaurant_id)
end
end
