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

    describe 'activity should optionally belong to group' do
      it { is_expected.to belong_to(:group).optional }
    end

    describe 'activity should have many likes' do
      it { is_expected.to have_many(:likes) }
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

    describe ':ungrouped' do
      let!(:activity) { create(:activity) }
      let!(:ungrouped_activity) { create(:activity, :no_group) }

      it 'creates a list of activities not assigned to a group' do
        expect(described_class.count).to eq 2
        expect(described_class.ungrouped.count).to eq 1
      end
    end
  end
end
