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
    @food = Food.new(params[:food])
    authorize @food
  end

  def edit
    @food = Food.find(params[:id])
    authorize @food
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
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = "Your gift item was successfully destroyed."
    authorize @food
    redirect_to foods_url
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end


end
