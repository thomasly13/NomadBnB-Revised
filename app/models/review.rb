# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  rating         :integer          not null
#  body           :text
#  listing_id     :bigint           not null
#  reviewer_id    :bigint           not null
#  reservation_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Review < ApplicationRecord
    validates :rating, :listing_id, :reviewer_id, :reservation_id, presence: true
    validates :body, length: {in: 0..255}

    belongs_to :listing, 
    foreign_key: :listing_id, 
    class_name: :Listing

    belongs_to :reviewer,
    foreign_key: :reviewer_id,
    class_name: :User 

    belongs_to :reservation,
    foreign_key: :reservation_id,
    class_name: :Reservation




end
