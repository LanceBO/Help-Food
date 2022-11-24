class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    skip_policy_scope
    # @foods = Food.includes(:bookings).where(bookings: {id: nil})
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @foods = Food.includes(:bookings).where(bookings: {id: nil}).where(sql_query, query: "%#{params[:query]}%")
    else
      @foods = Food.includes(:bookings).where(bookings: {id: nil})
    end

    @markers = @foods.geocoded.map do |food|
      {
        lat: food.latitude,
        lng: food.longitude,
        info_window: render_to_string(partial: "info_window", locals: {food: food}),
        image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/59/59077.png")
      }
    end

    authorize @foods
  end

  def show
    skip_policy_scope
    @food = Food.find(params[:id])
    authorize @food
  end

  def new
    @food = Food.new
    authorize @food
  end

  def create
    @food = Food.new(food_params)

    @food.user = current_user
    authorize @food
    if @food.save
    redirect_to foods_path
    else
    render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
    authorize @food
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    authorize @food
    redirect_to foods_path
  end

  def validate
    authorize @food
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = "Your gift item was successfully destroyed."
    redirect_to foods_path, status: :see_other
    authorize @food
  end


  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :category, :expiration_date, :photo, :address)
  end
end
