require 'rails_helper'

RSpec.describe GroupActivity, type: :model do
  describe 'validations' do
    it 'validates uniqueness of activity and group' do
      subject.activity = create(:activity)
      is_expected.to validate_uniqueness_of(:activity_id).scoped_to(:group_id)
    end
  end

  context 'associations' do
    describe 'group_activity should belong to activity' do
      it { is_expected.to belong_to(:activity) }
    end

    describe 'group_activity should belong to group' do
      it { is_expected.to belong_to(:group) }
    end
  end
end
