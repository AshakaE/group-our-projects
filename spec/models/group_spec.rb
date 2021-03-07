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
