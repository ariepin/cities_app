class Api::V1::CitiesController < ApplicationController
  skip_before_action :authenticate_user, only: :index

  def index
    cities = if params[:by_popularity].present?
               City.by_popularity
             else
               City.by_creation_date
             end
    render json: cities, status: :ok
  end

  def create
    city = City.new(city_params)
    if city.save
      render json: city, status: :created
    else
      render json: city.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :description, :population)
  end
end
