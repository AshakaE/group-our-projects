class Project < ApplicationRecord
  belongs_to :user
  has_many :groups

  validates :name, presence: true, length: { in: 4..18 }
  validates :description, presence: true, length: { in: 10..160 }
  validates :amount, presence: true, numericality: true

  scope :ug_incl, -> { includes(:user, :group) }
  scope :desc, -> { order('created_at DESC') }
end
