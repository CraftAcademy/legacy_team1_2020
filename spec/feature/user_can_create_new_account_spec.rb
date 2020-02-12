require "rails_helper"
require "pry"

feature 'User can create a new account' do
    before do 
        visit new_user_registration_path
    end

    describe 'successfully' do
        before do             
            fill_in 'Name', with: 'Carlos'
            fill_in 'Email', with: 'carlos@mail.com'
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'password'
    
    
            click_on 'Create'
        end

        it 'displays welcome message' do
            expect(page).to have_content 'Hello, Carlos'
        end

        it 'redirects to root path' do
            expect(current_path).to eq root_path
        end
    end

    describe 'unsuccessfully' do
        describe 'with invalid email' do
            before do
                fill_in 'Name', with: 'Carlos'
                fill_in 'Email', with: 'carlosmail.com'
                fill_in 'Password', with: 'password'
                fill_in 'Password confirmation', with: 'password'
        
        
                click_on 'Create'
            end

            it 'returns error message' do
                expect(page).to have_content 'Email is invalid'
            end

        end
    end
end