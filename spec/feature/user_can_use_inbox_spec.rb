require "rails_helper"

feature 'navigate the inbox' do
    let(:sender) { FactoryBot.create(:user, email: 'sender99@mail.com', name: 'carlos') }
    let(:receiver) { FactoryBot.create(:user, email: 'receiver99@mail.com',name: 'oliver') }
    before do
    sender.send_message(receiver, 'Lorem ipsum...', 'Subject')
    end


    describe 'count mails in inbox'do

    it 'should have 1 new message in the inbox' do
        count = receiver.mailbox.inbox.count
        expect(count).to eq 1
      end

    end



    # before do 
    #     visit root_path 
    #     click_on 'Login'
    #     fill_in 'Email', with: user.email
    #     fill_in 'Password', with: user.password
    #     click_on 'Log in'
    #     click_on 'Inbox'
    #     # click_on 'Compose'

    # end 

   

    # describe 'accessing mailbox'do
  
    #     it'displays the inbox page'do
    #     expect(current_path).to eq mailbox_inbox_path
    #     end

    # end

    # describe 'accessing sent folder'do

    #     before do 
    #         click_on 'Sent'
    #     end

    #     it 'displays the sent page'do
    #     expect(current_path).to eq mailbox_sent_path
    #     end
    # end

    # describe 'accessing trash folder'do

    #     before do 
    #         click_on 'Trash'
    #     end

    #     it 'displays the trash page'do
    #     expect(current_path).to eq mailbox_trash_path
    #     end
    # end






end

   