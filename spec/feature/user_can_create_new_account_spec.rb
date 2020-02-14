require "rails_helper"


feature 'User can create a new account' do
    before do 
        visit new_user_registration_path
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

        it 'redirects you to root_path' do
            expect(current_path).to eq root_path
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
            expect(page).to have_content "Email can't be blank Password can't be blank Name can't be blank"
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
        let (:already_registred_user) { FactoryBot.create(:user, email: 'hey@mail.com', name: 'Valentine')}
        before do
            fill_in 'Name', with: already_registred_user.name
            fill_in 'Email', with: already_registred_user.email
            fill_in 'Password', with: 'password2'
            fill_in 'Password confirmation', with: 'password2'
            click_on "Create"

        end

        it 'displays error if email or name has already been used' do
          expect(page).to have_content 'Email has already been taken Name has already been taken'
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
end