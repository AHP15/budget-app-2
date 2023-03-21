require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  before :all do
    @group = Group.create(name: 'test', icon: 'icon url', user_id: 1)
  end

  it 'shows the right content' do
    visit '/users/1/categories'
    expect(page).to have_content('Login')
  end

  it 'shows the right content' do
    visit '/users/categories/new'
    expect(page).to have_content('Login')
  end
end
