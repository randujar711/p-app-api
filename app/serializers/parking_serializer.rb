class ParkingSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :price, :user_id, :date
  has_one :user
end
