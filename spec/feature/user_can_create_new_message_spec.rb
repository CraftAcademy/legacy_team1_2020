require "rails_helper"


feature 'User can create a new message' do
    let(:user) { FactoryBot.create(:user, email:'user1_email@gmail.com', password:'password1' )}

    before do 
        visit root_path 
        click_on 'Login'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        click_on 'Inbox'
        click_on 'Compose'

    end 

    describe 'user can view the compose button' do 

        it 'link to sign up from homepage takes user to sign up page' do
        expect(current_path).to eq new_conversation_path
        end
    end 
end