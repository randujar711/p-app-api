class Seller < ApplicationRecord
    has_many :parkings
    has_many :users, through: :parkings
end
