json.set! 'owner' do 
    json.extract! @listing.owner, :id, :first_name, :last_name    
end
 
sum = 0
json.set! "reviews" do 
    @listing.reviews.each do |review|
        json.set! review.id do 
            json.extract! review, :id, :rating, :body, :listing_id, :reviewer_id, :reservation_id
            reviewer = User.find_by(id: review.reviewer_id)
            json.reviewer reviewer
            sum += review.rating
        end
    end
end

json.listing do 
    json.extract! @listing, :id, :name, :description, :price, :address, :coordinates, :amenities, :num_of_guests, :num_of_baths, :num_of_bedrooms, :num_of_beds, :owner_id
    json.images @listing.photos.map { |file| file.url } 
    json.review (sum / (@listing.reviews.length * 1.00))
    json.reservations Reservation.black_out_dates(@listing.id)
end

