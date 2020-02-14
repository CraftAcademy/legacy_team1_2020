require "rails_helper"


feature 'User can view sent mail and reply' do
    let(:user) { FactoryBot.create(:user, email:'user1_email@gmail.com', password:'password1' )}

    before do 
        visit root_path 
        click_on 'Login'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        click_on 'Inbox'
        click_on 'Sent'

    end 
        it 'User start composing email ' do
          expect(current_path).to eq mailbox_sent_path
          end
#Test make user 1 send mail to user 2 then check that user 2 sees mail
# Test reply

    describe 'Successfully' do 
      before do
        click_on 'User'
        fill_in 'Subject', with: 'Subject'
        fill_in 'Type your message here', with: 'Message'
        click_on 'Send Message'
      end

    end
end