# == Schema Information
#
# Table name: listings
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  description     :text             not null
#  price           :integer          not null
#  address         :string           not null
#  coordinates     :string           not null
#  amenities       :string           not null
#  num_of_guests   :integer          not null
#  num_of_baths    :integer          not null
#  num_of_bedrooms :integer          not null
#  num_of_beds     :integer          not null
#  owner_id        :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null

require 'rails_helper'

RSpec.describe Listing, type: :model do 
     Listing.create(name: "Cool Listing", description: "Really Really Really cool Listing", price: 1100, address: "1212 Cool Street", coordinates: "9123021390123", amenities: "cool view", num_of_guests: 4, num_of_baths: 2, num_of_bedrooms: 2, num_of_beds: 2, owner_id: 1)

    describe 'Listing validations' do 
        it { should validate_presence_of(:name)}
        it { should validate_presence_of(:description)}
        it { should validate_presence_of(:price)}
        it { should validate_presence_of(:address)}
        it { should validate_presence_of(:coordinates)}
        it { should validate_presence_of(:amenities)}
        it { should validate_presence_of(:num_of_guests)}
        it { should validate_presence_of(:num_of_baths)}
        it { should validate_presence_of(:num_of_bedrooms)}
        it { should validate_presence_of(:num_of_beds)}
        it { should validate_presence_of(:owner_id)}
    end

    describe 'associations' do 
        it {should belong_to(:owner).class_name(:User)}
    end

    
    
end