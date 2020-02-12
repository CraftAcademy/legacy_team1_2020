#mailbox_test   #Test if link to inbox takes the user to the inbox
require "rails_helper"
require "pry"



feature 'User can access inbox' do
    before do 
        visit root_path
    end

    it'display login' do
        expect(page).to have_content'Login'
    end

    describe 'displays the login page' do
        before do      
            click_on 'Login'
            visit user_session_path
        end

        it 'displays login page' do
            expect(page).to have_content 'Log in'
        end
    end
end
