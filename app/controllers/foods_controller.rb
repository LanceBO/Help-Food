class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    skip_policy_scope
    @foods = Food.all
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
    params.require(:food).permit(:name, :category, :expiration_date, :photo)
  end
end
