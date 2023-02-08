class User < ApplicationRecord
    has_secure_password
    
    has_many :parkings 
    has_many :sellers, through: :parkings
end
