#mailbox_test   #Test if link to inbox takes the user to the inbox
require "rails_helper"
require "pry"



feature 'User tries to login' do
  let(:user) { FactoryBot.create(:user, email: 'user@mail.com', password: 'password') }

  before do 
    visit root_path

    click_on 'Login'
  end

  describe 'successfully' do
    before do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    it 'user gets redirected to root path' do
      expect(current_path).to eq root_path
    end

    it 'user gets welcome message' do
      expect(page).to have_content 'Hello, Joe'
    end
  end

  describe 'unsuccessfully with' do 
    describe 'incorrect password' do
      before do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'wrong_password'
        click_on 'Log in'
      end

      it 'user gets welcome message' do
        expect(page).to have_content 'Hello, Joe'
      end
    end

    describe 'non registred email' do
      before do
        fill_in 'Email', with: 'not_existent_user@mail.com'
        fill_in 'Password', with: user.password
        click_on 'Log in'
      end

      it 'user gets welcome message' do
        expect(page).to have_content 'Hello, Joe'
      end
    end

    describe 'invalid email' do
      before do
        fill_in 'Email', with: 'invalid_email.'
        fill_in 'Password', with: user.password
        click_on 'Log in'
      end

      it 'user gets welcome message' do
        expect(page).to have_content 'Hello, Joe'
      end
    end
  end
end
