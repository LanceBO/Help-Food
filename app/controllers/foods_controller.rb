class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  def index
    skip_policy_scope
    @foods = Food.all
    authorize @foods
  end

  def show
    authorize @food
    @food = Food.find(params[:id])
  end

  def new
    authorize @food
    @food = Food.new
  end

  def create
    authorize @food
    @food = Food.new(params[:food])
  end

  def edit
    authorize @food
    @food = Food.find(params[:id])
  end


  def validate
    authorize @food
  end

  def destroy
    authorize @food
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = "Your gift item was successfully destroyed."
    redirect_to foods_url
  end
end
