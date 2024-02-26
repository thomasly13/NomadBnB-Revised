class Api::ListingsController < ApplicationController

    def index 
        @listings = Listing.all 
        render :index
    end

    def show 
        @listing = Listing.find_by(id: params[:id])
        if @listing 
            render :show 
        else
            render json: { errors: 'Listing not Found'}, status: 422
        end
    end


    
end
