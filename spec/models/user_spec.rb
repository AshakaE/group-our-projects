require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have many groups' do
      t = User.reflect_on_association(:groups)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many projects' do
      t = User.reflect_on_association(:projects)
      expect(t.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    subject do
      described_class.new(name: 'Ashaka')
    end

    it 'is valid with valid name' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a length name < 4 or > 18 charactars' do
      subject.name = 'Sam'
      expect(subject).to_not be_valid
    end

    it 'creates a user with a default avatar' do
      @user = User.create(name: 'Ashaka')
      expect(@user.icon.empty?).to eq false
    end
  end
end
