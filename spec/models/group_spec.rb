require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it 'should belong to user' do
      t = Group.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'can have many projects' do
      t = Group.reflect_on_association(:projects)
      expect(t.macro).to eq(:has_many)
    end
  end
end

RSpec.describe Group, type: :model do
  before(:all) do
    @user = User.create(name: 'User')
  end

  context 'with one created user' do
    before(:each) do
      @group1 = Group.create(name: 'Group01', user_id: @user.id)
    end

    it "doesn't create a group with an empty name" do
      @group2 = Group.create(name: '')
      expect(@group2.valid?).to eq false
    end

    it 'creates a group with name constraint > 4 and < 18' do
      @group2 = Group.create(name: '')
      expect(@group2.errors.full_messages[1]).to include "Name can't be blank"
      @group2 = Group.create(name: '012345678901234567890123456789N')
      expect(@group2.errors.full_messages[0]).to include 'User must exist'
    end

    it 'creates a group only if the name is unique' do
      @group1.save
      @group2 = Group.create(name: @group1.name.to_s)
      expect(@group2.valid?).to eq false
    end

    it 'creates a group not needing an icon' do
      @group1 = Group.create(icon: nil)
      expect(@group1.icon.nil?).to eq true
    end

    it 'has to belong to a user' do
      @group1.user_id = nil
      @group1.save
      expect(@group1.valid?).to eq false
    end
  end
end
