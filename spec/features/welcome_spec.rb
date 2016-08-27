require 'rails_helper'

RSpec.feature "LandingPages", type: :feature, js: true do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'that I am on the welcome page' do
        visit '/'
      end
      Then 'I can see a registration form' do
        expect(page).to have_content("Registration Form")
      end
    end
  end
  context 'Filling in registration form' do
    Steps 'Fill in registration first name, last name, Street address, City, State, Postal code, Country, Email address, User ID, and Password' do
      Given 'that I am on the welcome page' do
        visit '/'
      end
      # Story: As an internet user, I can go to a web site where I am presented with a registration form where user ID and password are required.
      When 'I fill in the registration first name, last name, Street address, City, State, Postal code, Country, Email address, User ID, and Password' do
        fill_in 'firstname', with: 'magic'
        fill_in 'lastname', with: 'man'
        fill_in 'streetaddress', with: 'wowoo'
        fill_in 'city', with: 'yoyon'
        fill_in 'state', with: 'California'
        fill_in 'zip', with: '11213'
        fill_in 'country', with: 'United States'
        fill_in 'email', with: 'wowowow@gmail.com'

      end
      Then 'given that if there is no username and password the confirmation page will not load' do
      expect(page).to have_content('Registration Form')
      end
      Given 'that I have filled in the userid and password slots, I can click the Register button' do
        fill_in 'userid', with: 'remdogg'
        fill_in 'password', with: 'gonefishing'
        click_button 'Register'
      end
      Then 'I will be taken to the confirmation page' do
        expect(page).to have_content 'Registration Confirmation'
      end
      # Story: As a registered user, I can login into the web site by providing user ID and password. If log in is successful, I am taken to a page saying "Hello <user ID>".
      Given 'that I have filled in the user id and password on the confirmation page, i can click the login button' do
        fill_in 'userid', with: 'remdogg'
        fill_in 'password', with: 'gonefishing'
        click_button 'Login'
      end
      Then 'I will be taken to the home page' do
        expect(page).to have_content("hello")
      end
    end
  end
end
