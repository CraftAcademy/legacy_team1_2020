#mailbox_test   #Test if link to inbox takes the user to the inbox
require "rails_helper"
require "pry"



feature 'User can access inbox' do
    before do 
        visit root_path
    end

        #Checking Login from homepage
    it'display login' do
        expect(page).to have_content'Login'
    end

        #Testing components from Log in page
    describe 'displays the login page' do
        before do      
            click_on 'Login'
            visit user_session_path
        end

        it 'displays login page' do
            expect(page).to have_content 'Log in'
        end

        it' display the input fields' do
            expect(page).to have_field 'Email'
        end
        
        it' display the input fields' do
            expect(page).to have_field 'Password'
        end

        it' display the input fields' do
            expect(page).to have_field 'Remember me'
        end

        it' display the link' do
            expect(page).to have_link('Sign up', href: new_user_registration_path)
            #it { should have_link('Help', href: help_path) }
        end

        it 'display the link' do
            expect(page).to have_link('Forgot your password?', href: new_user_password_path)
        end

        it'displays the Sign up button' do
            expect(page).to have_link('Sign up', href: new_user_registration_path)
        end

        it 'displays the link to the home page' do
            expect(page).to have_link('CA Mailboxer', href: root_path)
        end

    end

end
