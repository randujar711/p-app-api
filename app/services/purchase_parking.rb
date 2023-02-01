class PurchaseParking
  def self.update_balance(user, price)
    pp'hello'
    user.balance -= price
    user.save!
    pp user
    pp'user'
  end
  def self.update_spot_owner(user2, price2)
    pp 'hello2'
    p.user.balance -= price 
    user.save!

    pp user 
    pp'user2'
  end
end





