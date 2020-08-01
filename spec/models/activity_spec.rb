require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:amount) }
  end

  context 'associations' do
    describe 'activity should belong to author' do
      it { is_expected.to belong_to(:author) }
    end

    describe 'activity should have many likes' do
      it { is_expected.to have_many(:likes) }
    end

    describe 'activity should have many groups' do
      it { is_expected.to have_many(:groups) }
    end
  end

  context 'scopes' do
    describe ':most recent' do
      let!(:old_activity) { create(:activity) }
      let!(:new_activity) { create(:activity) }

      it 'creates a list of activities in descending order' do
        expect(described_class.most_recent.first).to eq new_activity
        expect(described_class.most_recent.last).to eq old_activity
      end
    end

    describe ':no_group' do
      let!(:activity) { create(:activity) }
      let!(:other_activity) { create(:activity) }
      let!(:group) { create(:group) }

      it 'creates a list of activities not assigned to a group' do
        GroupActivity.create(group: group, activity: activity)
        expect(described_class.count).to eq 2
        expect(described_class.no_group.count).to eq 1
      end
    end
  end
end
