require 'rails_helper'

RSpec.describe User, type: :model do
    #before(:all) do
        #@user1 = create(:user)
      #end
    describe 'DB table' do
        it { is_expected.to have_db_column :email }
        it { is_expected.to have_db_column :name }
        it { is_expected.to have_db_column :id}
    end
end
