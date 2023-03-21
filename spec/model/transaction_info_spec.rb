require 'rails_helper'

RSpec.describe TransactionInfo, type: :model do
  before :all do
    @user = User.create(name: 'test', email: 'test@gmail.com', encrypted_password: 'test_test')
    @transaction_info = TransactionInfo.create(name: 'trans', amount: 1.5, user: @user.id)
  end

  it 'name should be present' do
    @transaction_info.name = nil
    expect(@transaction_info).to_not be_valid
  end

  it 'amount should be present' do
    @transaction_info.amount = nil
    expect(@transaction_info).to_not be_valid
  end
end
