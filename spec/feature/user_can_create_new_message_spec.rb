require "rails_helper"


feature 'User can send an email' do
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
        it 'User start composing email ' do
          expect(current_path).to eq new_conversation_path
          end

    describe 'Successfully' do 
      before do
        click_on 'User'
        fill_in 'Subject', with: 'Subject'
        fill_in 'Type your message here', with: 'Message'
        click_on 'Send Message'
      end

        it 'Mail sent' do
            expect(page).to have_content 'message was successfully sent'
        end
    end 
end