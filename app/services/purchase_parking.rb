class PurchaseParking
  # You cannot use "params" outside of a Controller 
  def self.update_buyer_balance(user_id, price, parking_id)
    pp'hello'
    user = User.find_by!(id: user_id)
    parking = Parking.find_by!(id: parking_id)
    pp user.balance
    user.balance -= price
    user.save!
    pp user.balance
    pp user
    pp'end buyer update'
  end
  def self.update_seller_balance(user_id, price)
    user = User.find_by!(id: user_id)
    pp user.balance
    pp'balance before'
    user.balance += price
    user.save!
    pp user.balance
    pp'balance after'

    pp'end seller update'
  end
end





