class Api::ReviewsController < ApplicationController

    before_action :required_logged_in
    wrap_parameters include: Reservation.attribute_names + ['rating', 'body', 'listingId', 'reservationId']


    def create 
        @review = Review.new(review_params)
        @review.reviewer_id = current_user.id 
        @user = current_user
        @reservation = Reservation.find_by(id: params[:reservation_id])
        if @review.save
            render 'api/reservations/show'
        else
            render json: { errors: @review.errors }, status: 444
        end

    end 

    def update 
        @review = Review.find_by(id: params[:id])
        @reservation = Reservation.find_by(id: params[:reservation_id])
        @user = current_user
        if current_user.id != @review.reviewer_id
            render json: {errors: 'Unauthorized'}, status: 422 
        else
            @review.update(review_params)
            render 'api/reservations/show'
        end          
    end 

    def destroy
        @review = Review.find_by(id: params[:id])
 
        @reservation = Reservation.find_by(id: @review.reservation_id)
        @user = current_user
        if current_user.id == @review.reviewer_id && @review&.delete
            render 'api/reservations/show'
        else
            render json: {errors: "Unauthorized"}, status: 422 
        end
    end

    private 

    def review_params 
        params.require(:review).permit(:rating, :body, :listing_id, :reservation_id)
    end 
end
