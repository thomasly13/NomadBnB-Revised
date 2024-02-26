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
#
class Listing < ApplicationRecord
    validates :name, :description,
     :price, :address, :coordinates,
      :amenities, :num_of_guests, :num_of_baths,
       :num_of_bedrooms, :num_of_beds, :owner_id,
        presence: true

    belongs_to :owner,
    foreign_key: :owner_id,
    class_name: :User

    has_many :reservations,
    foreign_key: :listing_id,
    class_name: :Reservation,
    dependent: :destroy

    has_many :reviews,
    foreign_key: :listing_id,
    class_name: :Review,
    dependent: :destroy

    has_many_attached :photos
end
