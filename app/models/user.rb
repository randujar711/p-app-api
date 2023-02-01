class User < ApplicationRecord
    has_many :parkings
    has_many :sellers, through: :parkings
end
