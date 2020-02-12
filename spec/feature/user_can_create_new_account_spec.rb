require "rails_helper"
require "pry"

feature 'User can create a new account' do
    before do 
        visit new_user_registration_path
    end

    it 'displays the sign up page' do
        expect(page).to have_field 'Name'
        expect(page).to have_field 'Email'
        expect(page).to have_field 'Password'
    end

    #Happy path where user enters what we want and the sign up is successful
    describe 'User correctly and successfully entered their data to create account' do
        before do 
            #add dummy user data with fillin
            fill_in 'Name', with: 'Janko'
            fill_in 'Email', with: 'test_email@gmail.com'
            fill_in 'Password', with: 'password1'
            fill_in 'Password confirmation', with: 'password1'

            click_on "Create"
        end 
        it 'displays message if sign up was successful' do
            expect(page).to have_content 'Hello, Janko'
        end 
    end 

    #Sad path
    describe 'User does not put any input' do
     before do
       fill_in 'Name', with: ''
       fill_in 'Email', with: ''
       fill_in 'Password', with: ''
       fill_in 'Password confirmation', with: ''

        click_on "Create"
    end

    it 'Displays an error for missing data' do
        expect(page).to have_content "Email can't be blank"
        expect(page).to have_content "Password can't be blank"
        expect(page).to have_content "Name can't be blank"
    end
end
  
    describe 'User enters email in a wrong format' do
        before do
            fill_in 'Name', with: 'Janko'
            fill_in 'Email', with: 'test_emailgmail.com'
            fill_in 'Password', with: 'password1'
            fill_in 'Password confirmation', with: 'password1'

            click_on "Create"
        end

        it 'displays error if email format is entered incorrectly' do
          expect(page).to have_content 'Email is invalid'
        end 

    end
end

