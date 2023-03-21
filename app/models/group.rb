class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transaction

  validates :name, presence: true
  validates :icon, presence: true
end
