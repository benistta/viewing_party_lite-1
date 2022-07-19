require 'rails_helper'

RSpec.describe 'login page' do
  it 'user can login' do
    user_1 = User.create(name: 'me', email: 'me@gmail.com', password: 'hi', password_confirmation: 'hi')

    visit '/login'

    fill_in 'Email', with: "#{user_1.email}"
    fill_in 'Password', with: "#{user_1.password}"
    click_button('Log In')

    expect(current_path).to eq(user_path(user_1.id))
  end

  it 'fail to fill in in correct info' do
    user = User.create!(name: 'me', email: 'me@gmail.com', password: 'hi', password_confirmation: 'hi')

    visit "/login"

    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "que"
    click_button('Log In')

    expect(current_path).to eq('/login')
    expect(page).to have_content("Invalid Credentials")
  end
end
