require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  context 'associations' do
    describe 'group has many activites' do
      it { is_expected.to have_many(:activities) }
    end
  end

  context 'scope' do
    describe '.alphabetical' do
      it 'creates a list of the groups sorted in alphabetical order' do
        create(:group, name: 'band')
        create(:group, name: 'altwork')
        expect(described_class.first.name).to eq('band')
        expect(described_class.alphabetical.first.name).to eq('altwork')
      end
    end
  end

  context 'attachments' do
    describe '._add_default_icon' do
      let(:group) { create(:group) }

      it 'attaches a default icon if user does not upload one' do
        expect(group.icon).to be_attached
        expect(group.icon.filename.to_s).to include('default.png')
      end
    end

    describe 'random icon uploaded' do
      let(:group) { create(:group, :with_uploaded_icon) }

      it 'has an uploaded icon chosen by the user' do
        expect(group.icon).to be_attached
        expect(group.icon.filename.to_s).to include('test-image.jpg')
      end
    end
  end
end
