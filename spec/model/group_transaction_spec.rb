require 'rails_helper'

RSpec.describe GroupTransaction, type: :model do
  before :all do
    @user = User.create(name: 'test', email: 'test@gmail.com', encrypted_password: 'test_test')
    @group = Group.create(name: 'group_test', icon: 'test_url', user: @user.id)
    @transaction_info = TransactionInfo.create(name: 'trans', amount: 1.5, user: @user.id)

    @group_trans = GroupTransaction.create(transaction_info: @transaction_info.id, group: @group.id)
  end

  it 'group_trans should be valid' do
    @group_trans.transaction_info = nil
    expect(@group_trans).to_not be_valid
  end
end
