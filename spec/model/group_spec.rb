require 'rails_helper'

RSpec.describe Group, type: :model do
  before :all do
    @user = User.create(name: 'test', email: 'test@gmail.com', encrypted_password: 'test_test')
    @group = Group.create(name: 'group_test', icon: 'test_url', user: @user.id)
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
