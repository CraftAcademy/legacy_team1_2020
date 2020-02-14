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
    end

    describe 'Successfully' do 
      before do
        click_on 'Compose'
        click_on 'User'
        fill_in 'Subject', with: 'Subject sent mail'
        fill_in 'Type your message here', with: 'Message for sent mail'
        click_on 'Send Message'
        click_on 'Sent'
      end

      it 'User can view a sent email' do
          expect(page).to have_content 'Subject sent mail'
      end

      it 'User can navigate to Sent mails ' do
        expect(current_path).to eq mailbox_sent_path
      end

        describe 'User can view the sent mail item' do 
            before do 
                click_on 'View'

             end 

            #it 'User is redirected to the specific mail item' do
                #expect(current_path).to eq conversation_path()
            #end 

            it 'User can open a sent message' do
                expect(page).to have_content 'Move to trash'
            end 

        end 
 
    end
end
