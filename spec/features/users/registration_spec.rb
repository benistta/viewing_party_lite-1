require 'rails_helper'

RSpec.describe 'user_registration' do
  it 'creating new user' do
    visit '/register'

    name = "becky"
    email = "becky@test.com"
    password = "hola"


    fill_in :user_email, with: email
    fill_in :user_name, with: name
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
    click_on 'Create User'
    expect(current_path).to eq("/users/#{User.last.id}")

    expect(User.last).to_not have_attribute(:password)
    expect(page).to have_content("Welcome, #{name}!")
    expect(User.last.password_digest).to_not eq('hola')
  end
end
