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
end
