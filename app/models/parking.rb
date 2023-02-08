class Parking < ApplicationRecord
    belongs_to :user
    belongs_to :seller, optional: true 
    
end
