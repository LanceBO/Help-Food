class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def new
    @food = Food.find(params[:food_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @food = Food.find(params[:food_id])
    @booking.user = current_user
    @booking.food = @food
    authorize @booking
    if @booking.save
      flash[:notice] = "Successfully created booking."
      redirect_to foods_path
    else
      render :new
    end

  end

  def destroy
    @booking = Booking.find(params[:booking_params])
    @booking.destroy
    authorize @booking
    flash[:success] = "Your food booking was successfully deleted."
    redirect_to bookings_url
  end

  def validate
    authorize @booking
  end


  def show
    @booking = Booking.find(params[:booking_params])
    authorize @booking
  end

  def index
    skip_policy_scope
    @bookings = Booking.all
    authorize @bookings
  end

  def update
    @booking = Booking.edit(params[:booking_params])
    authorize @booking
  end


  def update
    @booking = Booking.edit(params[:booking_params])
    authorize @booking
  end

  def dashboard
  end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :food_id)
  end

end
