require "rails_helper"


feature 'User can send an email' do
    let(:sender) { FactoryBot.create(:user, email:'user1_email@gmail.com', password:'password1' )}
    let!(:receiver) { FactoryBot.create(:user, email:'receiver_email@gmail.com', password:'password1', name: 'Carl' )}

    before do 
        login_as(sender)
        visit root_path 
        click_on 'Inbox'
        click_on 'Compose'
    end

    describe 'Successfully' do 
      before do
        select 'Carl', from: 'Recipients'
        fill_in 'Subject', with: 'Subject'
        fill_in 'Type your message here', with: 'Message'
        click_on 'Send Message'
      end

        it 'Mail sent' do
            expect(page).to have_content 'Your message was successfully sent!'
        end
    end 
     
    #Note: The next describe block fails because the feature currently send even when no recipient is selected
     describe 'Unsuccessfully - missing recipient' do 
      before do
        fill_in 'Subject', with: 'Subject'
        fill_in 'Type your message here', with: 'Message'
        click_on 'Send Message'
      end 

      it 'return error message' do
        expect(page).to have_content 'Make sure you fill out every possible message option'
      end
    end

    #Note: Feature seems to break if subject is missing. Code needs to be modified before test will pass.
    describe 'Unsuccessfully - missing subject' do 
        before do
            select 'Carl', from: 'Recipients'
            fill_in 'Subject', with: ''
            fill_in 'Type your message here', with: 'Message'
            click_on 'Send Message'
        end 
  
        it 'return error message' do
            expect(page).to have_content 'Make sure you fill out every possible message option'
          end
    end

        #Note: Feature seems to break if the message is missing. Code needs to be modified before test will pass.
    describe 'Unsuccessfully - missing message' do 
        before do
            select 'Carl', from: 'Recipients'
            fill_in 'Subject', with: 'Subject'
            fill_in 'Type your message here', with: ''
            click_on 'Send Message'
        end 
  
        it 'return error message' do
            expect(page).to have_content 'Make sure you fill out every possible message option'
        end    
      end
end