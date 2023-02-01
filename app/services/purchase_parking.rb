class PurchaseParking
  # You cannot use "params" outside of a Controller 
  def self.update_balance(user_id, price, parking_id)
    pp'hello'
    user = User.find_by!(id: user_id)
    parking = Parking.find_by!(id: parking_id)
    pp user.balance
    user.balance -= price
    user.save!
    pp user.balance
    pp user
    pp'end'
  end
end





