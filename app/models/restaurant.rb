class Restaurant < ApplicationRecord
  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true


    def build_with_user(attributes = {}, user)
      attributes[:user] ||= user
      build(attributes)
    end


  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user
    review
  end
end
