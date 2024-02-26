@listings.each do |listing|
    json.set! "listings" do 
        json.set! listing.id do 
            json.extract! listing, :id, :name, :description, :price, :address, :coordinates, :amenities, :num_of_guests, :num_of_baths, :num_of_bedrooms, :num_of_beds, :owner_id
            json.images listing.photos.map { |file| file.url }
            
        end        
    end

    json.set! "owners" do 
        json.set! listing.owner.id do 
            json.extract! listing.owner, :id, :first_name, :last_name
        end        
    end
end

