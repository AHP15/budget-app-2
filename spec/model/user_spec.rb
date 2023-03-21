require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(name: 'test', email: 'test@gmail.com', encrypted_password: 'test_test')
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'email should be present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'encrypted_password should be present' do
    @user.encrypted_password = nil
    expect(@user).to_not be_valid
  end
end
