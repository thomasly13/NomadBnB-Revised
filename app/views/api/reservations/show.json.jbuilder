
json.listing do 
    json.extract! @reservation.listing, :id, :name, :description, :price, :address, :coordinates, :amenities, :num_of_guests, :num_of_baths, :num_of_bedrooms, :num_of_beds, :owner_id
    json.images @reservation.listing.photos.map { |file| file.url }   
end

json.reservation do 
    json.extract! @reservation, :id, :num_of_guests, :check_in_date, :check_out_date, :listing_id, :renter_id
    json.previous (@reservation.check_out_date < Date.today)
    if @reservation.review
        json.reviewId @reservation.review.id
    else
        json.reviewId nil
    end
end

json.user do 
    json.extract! @reservation.renter, :id, :first_name, :last_name
end

json.set! 'reviews' do 
    if @reservation.review
        json.set! @reservation.review.id do 
            json.extract! @reservation.review, :rating, :listing_id, :reviewer_id, :reservation_id, :body
        end     
    else
        json.reviewId nil
    end
end