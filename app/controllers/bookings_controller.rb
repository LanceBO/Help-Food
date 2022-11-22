class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def new
    authorize @booking
    @booking = Booking.new
  end

  def create
    authorize @booking
    @booking = Booking.new(params[:booking_params])
  end

  def destroy
    authorize @booking
    @booking = Booking.find(params[:booking_params])
    @booking.destroy
    flash[:success] = "Your food booking was successfully deleted."
    redirect_to bookings_url
  end

 def validate
  authorize @booking
 end

def show
  authorize @booking
  @booking = Booking.find(params[:booking_params])

end

def index
  authorize @booking
  @bookings = Booking.all
end

def update
  authorize @booking
  @booking = Booking.edit(params[:booking_params])
end


  private

  def booking_params
    params.require(:booking).permit(:user_id, :food_id)
  end

end
