class FavouriteCity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates_uniqueness_of :city_id, scope: :user_id, message:  I18n.t('city.unique')
end
