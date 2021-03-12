class Group < ApplicationRecord
  belongs_to :user
  has_many :projects

  validates :name, presence: true, uniqueness: true
end
