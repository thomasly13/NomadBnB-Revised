class Api::ReservationsController < ApplicationController

  before_action :required_logged_in
  wrap_parameters include: Reservation.attribute_names + ['numOfGuests', 'listingId', 'checkInDate', 'checkOutDate']

  def index 
    @reservations = Reservation.listing_reservations(id: params[:id])

    render :index
  end

  def show 
    @reservation = Reservation.find_by(id: params[:id])

    if @reservation
      render :show 
    else
      render json: { errors: 'Reservation not Found'}, status: 422
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.renter_id = current_user.id

    if @reservation.save
      render json: { errors: 'Awesome Made!'}, status: 222
    else
      render json: { errors: @reservation.errors }, status: 444
    end 
  end

  def update 
    @reservation = Reservation.find_by(id: params[:id])
    @user = current_user
    if current_user.id != @reservation.renter_id
      render json: {errors: 'Unauthorized'}, status: 422 
    else
      @reservation.update(reservation_params)
      render 'api/users/show'
    end
  end 

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    if @reservation&.delete 
      render 'api/users/show'
    else
      render json: {errors: 'Bro Unauthorized'}, status: 422 
    end
  end

  
  def reservation_params 
    params.require(:reservation).permit(:num_of_guests, :listing_id, :check_out_date, :check_in_date)
  end
end
