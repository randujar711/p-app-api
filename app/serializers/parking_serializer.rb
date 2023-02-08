class ParkingSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :price, :user_id
  has_one :user
end
