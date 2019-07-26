class Api::V1::FavouriteCitiesController < ApplicationController
  def index
    render json: current_user.cities, status: :ok, each_serializer: CitySerializer
  end

  def create
    city = City.find(params[:id])
    favourite_city = current_user.favourite_cities.new
    favourite_city.city_id = city.id
    if favourite_city.save
      render json: { message: I18n.t('city.added') }, status: :ok
    else
      render json: favourite_city.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    city = FavouriteCity.find_by(user_id: current_user.id, city_id: params[:id])
    if city.destroy
      render json: { message:  I18n.t('city.removed') }, status: :ok
    else
      render json: city.errors.full_message, status: :unprocessable_entity
    end
  end
end
