# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null


require 'rails_helper'

RSpec.describe User, type: :model do 
    subject { User.create!(email: 'lilly_llama@gmail.com', password: 'password', first_name: "Bro", last_name: "ly") }


    describe 'User validations' do 
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email)}
        it { should validate_length_of(:email).is_at_least(3).is_at_most(255)}
        it { should validate_presence_of(:first_name)}
        it { should validate_presence_of(:last_name)}
        it { should validate_presence_of(:password_digest)}
        it { should validate_length_of(:password).is_at_least(6).is_at_most(255)}
    end

    describe 'associations' do 
        it{ should have_many(:listings)}
    end

    describe 'password encryption' do 
        it 'does not save passwords to the database' do 
            User.create!(email: 'naruto@gmail.com', password:'password', first_name: "naruto", last_name: "Uzamaki")
            naruto = User.find_by(email: 'naruto@gmail.com')
            expect(naruto.password).to_not be("password")
        end

        context 'saves passwords properly' do 
            it 'encrypts the password using BCrypt' do 
                expect(BCrypt::Password).to receive(:create)
                User.new(email:"Sasuke", password:"brooooo")
            end

            it 'properly sets the password reader' do
                user = User.new(email:"Sasuke", password:"brooooo")
                expect(user.password).to eq("brooooo")
            end
        end
    end


    describe 'session token' do 
        it 'assigns a session token if one is not given' do 
            expect(subject.session_token).not_to be_nil
        end
    end

    describe 'finds users by credentials' do
        context 'with a valid email and password' do 
            it 'return the proper user' do 
                neji = User.create(email:"neji@gmail.com", password:"password", first_name:"Neji", last_name:"Hyuga")
                user = User.find_by_credentials('neji@gmail.com', 'password')

                expect(neji.email).to eq(user.email)
                expect(neji.password_digest).to eq(user.password_digest)
            end
        end

        context 'with an invalid email and password' do 
            it 'returns nil' do
                lee = User.create(email:"lee@gmail.com", password:"password", first_name:"Rock", last_name:"lee")
                user = User.find_by_credentials('lee@gmail.com', 'notthepassword')
                expect(user).to be_nil
            end
        end
    end
end