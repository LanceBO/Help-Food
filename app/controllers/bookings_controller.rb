class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
  end

  def destroy
    @booking = Booking.find(params[:booking])
  end

 def validate
 end

def show
  @booking = Booking.find(params[:id])

end

def index
  @bookings = Booking.all
end


  private

  def booking_params
    params.require(:booking).permit(:user_id)
  end

end
