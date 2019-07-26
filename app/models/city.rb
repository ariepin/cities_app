class City < ApplicationRecord
  before_save :find_coordinates

  has_many :favourite_cities

  scope :by_popularity, -> { left_joins(:favourite_cities)
                             .group(:id)
                             .order('COUNT(favourite_cities.city_id) DESC') }
  scope :by_creation_date, -> { order(created_at: :desc) }

  private

  def find_coordinates
    results = Geocoder.search(name)
    coordinates = results.first.coordinates
    self.latitude = coordinates.first
    self.longtitude = coordinates.second
  end
end
