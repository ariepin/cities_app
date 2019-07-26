class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :latitude, :longtitude
end
