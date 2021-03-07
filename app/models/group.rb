class Group < ApplicationRecord
  belongs_to :user
  has_many :projects

  has_one_attached :icon

  validates :icon, attached: true, content_type: %i[png jpg jpeg]
  validates :name, presence: true, uniqueness: true
end
