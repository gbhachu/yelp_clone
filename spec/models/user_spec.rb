require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_uniqueness_of(:user).scoped_to(:restaurant) }
end
