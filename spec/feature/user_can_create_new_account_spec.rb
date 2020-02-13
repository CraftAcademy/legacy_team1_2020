require "rails_helper"


feature 'User can create a new account' do
    describe 'user can access sign up page' do 
        before do 
            visit root_path
            click_on "Sign up"
        end

        it 'link to sign up from homepage takes user to sign up page' do
        expect(current_path).to eq new_user_registration_path
        end

    end 

    before do 
        visit new_user_registration_path
    end

    it 'displays the sign up page' do
        expect(page).to have_field {'Name';'Email';'Password'}

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
            expect(page).to have_content 'Welcome! You have signed up successfully.'
        end 

    end 

    #Sad paths
    describe 'User does not put any input' do
        before do
            fill_in 'Name', with: ''
            fill_in 'Email', with: ''
            fill_in 'Password', with: ''
            fill_in 'Password confirmation', with: ''
            click_on "Create"
        end

        it 'Displays an error for missing data' do
            expect(page).to have_content "Email can't be blank" "Password can't be blank" "Name can't be blank"
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

    describe 'If name and email have already been used' do
        before do
            fill_in 'Name', with: 'Janko'
            fill_in 'Email', with: 'test_emailgmail.com'
            fill_in 'Password', with: 'password1'
            fill_in 'Password confirmation', with: 'password1'

            click_on "Create"

            fill_in 'Name', with: 'Janko'
            fill_in 'Email', with: 'test_emailgmail.com'
            fill_in 'Password', with: 'password2'
            fill_in 'Password confirmation', with: 'password2'
        end

        it 'displays error if email or name has already been used' do
          expect(page).to have_content 'error prohibited this user from being saved'
        end 

    end

    describe 'User enters too short password or too long name' do
        before do
            fill_in 'Name', with: 'Janko Radakovic'
            fill_in 'Email', with: 'test_emailgmail.com'
            fill_in 'Password', with: 'pass'
            fill_in 'Password confirmation', with: 'pass'
            click_on "Create"
        end

        it 'displays error if name is more then 10 characters' do
          expect(page).to have_content 'Name is too long'
        end 

        it 'displays error if password is less then 8 characters' do
            expect(page).to have_content 'Password is too short'
          end 
    end

    describe 'User count in database equals 1' do
        before do 
            
            fill_in 'Name', with: 'Janko'
            fill_in 'Email', with: 'test_email@gmail.com'
            fill_in 'Password', with: 'password1'
            fill_in 'Password confirmation', with: 'password1'
            click_on "Create"
        end 

        it 'Checks if the user is saved in db' do
            expect(User.count).to eq 1
        end 

    end 
end




