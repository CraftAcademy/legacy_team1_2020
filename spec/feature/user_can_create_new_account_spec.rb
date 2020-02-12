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

    

end

