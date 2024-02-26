
json.user do
    json.set! "currentUser" do 
        json.extract! @user, :id, :email, :first_name, :last_name       
    end

    @user.reservations.each do |reservation|
        json.set! reservation.owner.id do
            json.extract! reservation.owner, :id, :first_name            
        end
    end
end

json.set! 'reservations' do

    json.set! 'previousReservations' do
        if @user.reservations.previous_reservations(@user.id).length != 0
            @user.reservations.previous_reservations(@user.id).each do |reservation|
                json.set! reservation.id do
                    json.extract! reservation, :id, :num_of_guests, :check_in_date, :check_out_date, :listing_id, :renter_id
                    if reservation.review
                        json.reviewId reservation.review.id
                    else
                        json.reviewId nil
                    end
                end
            end
        else
            json.reservation nil
        end         
    end 


    json.set! 'futureReservations' do 
        if @user.reservations.future_reservations(@user.id).length != 0
            @user.reservations.future_reservations(@user.id).each do |reservation|
                json.set! reservation.id do
                    json.extract! reservation, :id, :num_of_guests, :check_in_date, :check_out_date, :listing_id, :renter_id
                end
            end
        else
            json.reservation nil
        end        
    end

end

json.set! "listings" do 
    @user.reservations.each do |reservation|
        json.set! reservation.listing_id do
            json.extract! reservation.listing, :id, :name, :address, :owner_id, :num_of_guests, :coordinates
            json.images reservation.listing.photos.map { |file| file.url }
        end
    end
end

json.set! "reviews" do 
    @user.reviews.each do |review|
        json.set! review.id do 
            json.extract! review, :id, :rating, :body, :listing_id, :reviewer_id, :reservation_id
        end
    end
end

