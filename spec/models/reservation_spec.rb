
require 'rails_helper'

RSpec.describe Reservation, type: :model do 
    describe 'Reservation validations' do 
        it { should validate_presence_of(:num_of_guests)}
        it { should validate_presence_of(:check_in_date)}
        it { should validate_presence_of(:check_out_date)}
        it { should validate_presence_of(:listing_id)}
        it { should validate_presence_of(:renter_id)}
    end
end