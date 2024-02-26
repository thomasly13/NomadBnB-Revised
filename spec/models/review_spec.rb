
require 'rails_helper'

RSpec.describe Review, type: :model do 
        
    describe 'view validation' do 
        it { should validate_presence_of(:rating)}
        it { should validate_presence_of(:listing_id)}
        it { should validate_presence_of(:reviewer_id)}
        it { should validate_presence_of(:reservation_id)}
    end
end