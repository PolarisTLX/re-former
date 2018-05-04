require 'spec_helper'
require 'rails_helper'

RSpec.feature "User edits info", :type => :feature do

  scenario "User edits sucessfully" do
    visit "/users/1/edit"

    fill_in "Password", :with => "password"

    click_button "Submit"

    expect(page).to have_text("User was updated")
  end

  scenario "User submits invalid info" do
    visit "/users/1/edit"

    # No form fields filled in

    click_button "Submit"

    expect(page).to have_text("Password can't be blank")

  end

  scenario "User submits invalid info" do
    visit "/users/1/edit"

    fill_in "Username", :with => ""
    fill_in "Email", :with => ""
    fill_in "Password", :with => "password"


    click_button "Submit"

    expect(page).to have_text("Username can't be blank")
    expect(page).to have_text("Email can't be blank")

  end

  #  describe 'with valid name, email, and password' do
  #   it 'successfully adds the user' do
  #     expect{subject.save}.to change{User.count}.by(1)
  #     #expect(page).to have_content('Sign out')
  #   end
  # end

  # scenario 'with invalid email' do
  #   sign_up_with 'invalid_email', 'password'
  #
  #   expect(page).to have_content('Sign in')
  # end
  #
  # scenario 'with blank password' do
  #   sign_up_with 'valid@example.com', ''
  #
  #   expect(page).to have_content('Sign in')
  # end
  #
  # def sign_up_with(email, password)
  #   visit sign_up_path
  #   fill_in 'Email', with: email
  #   fill_in 'Password', with: password
  #   click_button 'Sign up'
  # end
end
