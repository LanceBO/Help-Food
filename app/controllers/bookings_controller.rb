class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking_params])
  end

  def destroy
    @booking = Booking.find(params[:booking_params])
  end

 def validate
 end

def show
  @booking = Booking.find(params[:booking_params])

end

def index
  @bookings = Booking.all
end


  private

  def booking_params
    params.require(:booking).permit(:user_id, :food_id)
  end

end
