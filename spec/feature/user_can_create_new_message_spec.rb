require "rails_helper"


feature 'User can create a new message' do
    describe 'user can view the compose button' do 
    RSpec.describe User, :type => :model do
        before (:all) do 
            @user1 = create(:user)
            visit root_path 
            click_on 'Inbox'
            #visit mailbox_inbox_path
            click_on 'Compose'
        end

        it 'link to sign up from homepage takes user to sign up page' do
        expect(current_path).to eq new_conversation_path
        end
    end 
end