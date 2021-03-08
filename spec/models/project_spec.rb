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
