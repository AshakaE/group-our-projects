class User < ApplicationRecord
  has_many :groups
  has_many :projects

  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 4, maximum: 18 }

  has_one_attached :icon
end
