require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it 'validates uniqueness of user for a single activity like' do
      subject.user = create(:user)
      is_expected.to validate_uniqueness_of(:user_id).scoped_to(:activity_id)
    end
  end
end
