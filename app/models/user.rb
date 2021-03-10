class User < ApplicationRecord
  before_create { self.icon = Faker::Avatar.image }

  has_many :groups
  has_many :projects

  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 4, maximum: 18 }
end
