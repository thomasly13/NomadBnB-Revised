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
#
class User < ApplicationRecord
  validates :session_token, presence: true, uniqueness:true
  validates :email, presence:true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP}, length: { in: 3..255}
  validates :password_digest, :first_name, :last_name, presence: true 
  validates :password, length: {in: 6..255}, allow_nil: true

  before_validation :ensure_session_token

  has_secure_password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      return user 
    end 
    nil
  end

  def ensure_session_token 
    self.session_token ||= generate_unique_session_token
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.save!
    self.session_token
  end

  private 

  def generate_unique_session_token
    while true 
      token = SecureRandom.urlsafe_base64
      return token unless User.exists?(session_token: token)
    end
  end

  has_many :listings,
  foreign_key: :owner_id,
  class_name: :Listing,
  dependent: :destroy

  has_many :reservations,
  foreign_key: :renter_id,
  class_name: :Reservation,
  dependent: :destroy

  has_many :reservation_listing,
  through: :reservations,
  source: :listing,
  dependent: :destroy

  has_many :reviews,
  foreign_key: :reviewer_id,
  class_name: :Review,
  dependent: :destroy 
  
end
