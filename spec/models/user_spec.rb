require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email}
    it { is_expected.to have_db_column :name}
    it { is_expected.to have_db_column :id}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_uniqueness_of :name} 
    it { should validate_length_of(:name).is_at_most(10) }
  end
end
