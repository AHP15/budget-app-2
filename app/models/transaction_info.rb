class TransactionInfo < ApplicationRecord
  belongs_to :user
  has_many :group_transaction

  validates :name, presence: true
  validates :amount, presence: true
end
