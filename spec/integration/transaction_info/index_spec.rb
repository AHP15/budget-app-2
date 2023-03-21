require 'rails_helper'

RSpec.describe 'TransactionInfo', type: :system do
  before :all do
    @transaction_info = TransactionInfo.create(name: 'test', amount: 15.4, user_id: 1)
  end

  it 'shows the right content' do
    visit '/users/1/categories/2'
    expect(page).to have_content('Login')
  end

  it 'shows the right content' do
    visit '/users/transactions/new'
    expect(page).to have_content('Login')
  end
end
