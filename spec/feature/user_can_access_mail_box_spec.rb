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
    # it 'displays the mailbox page' do
    # end

end