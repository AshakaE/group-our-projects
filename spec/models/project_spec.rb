require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it 'should belong to user' do
      t = Project.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should belong to group' do
      t = Project.reflect_on_association(:group)
      expect(t.macro).to eq(:belongs_to)
    end
  end

  describe 'validation check' do
    it 'requires name, description and amount to be present' do
      project = Project.new(name: 'Capstone', description: nil, amount: 4).save
      expect(project).to be false
    end
  end
end

RSpec.describe Project, type: :model do
  before(:all) do
    @user = User.create(name: 'User')
  end

  context 'test with one created user' do
    before(:each) do
      @project1 = Project.create(name: 'project01',
                                 description: 'description for trans 01',
                                 amount: 0.50,
                                 user_id: @user.id)
    end

    it "doesn't create a project with an empty name, amount or description" do
      @project2 = Project.create(name: '',
                                 description: '',
                                 amount: nil,
                                 user_id: @user.id)
      expect(@project2.valid?).to eq false
    end

    it 'creates a project with only a name constraint > 4 and < 18 chars' do
      @project1 = Project.create(name: '')
      expect(@project1.errors.full_messages[1]).to include "Name can't be blank"
      @project1 = Project.create(name: '012345678901234567')
      expect(@project1.errors.full_messages[0]).to include 'User must exist'
    end

    it 'creates a project only if the name is unique' do
      @project1 = Project.create(name: '')
      @project2 = Project.create(name: @project1.name.to_s,
                                 description: 'description for trans 01',
                                 amount: 10.160,
                                 user_id: @user.id)
      expect(@project2.valid?).to eq false
    end

    it 'creates a project not needing to belong to a group' do
      @project1 = Project.create(group_id: nil)
      expect(@project1.group.nil?).to eq true
    end

    it 'has to belong to a user' do
      @project1 = Project.create(user_id: nil)
      expect(@project1.valid?).to eq false
    end
  end
end
