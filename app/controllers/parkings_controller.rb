class ParkingsController < ApplicationController
    # after_action :update_buyer, only: [:update]z      z

    def index 
        parking = Parking.all 
        render json: parking
        ActionCable.server.broadcast('live_feed', {
            post: parking
        })
    end

    def show 
        spot = Parking.find_by!(id: params[:id])
        render json: spot 
    end

    def create 
       parking = Parking.create!(latitude: params[:latitude], longitude: params[:longitude], price: params[:price], date: params[:date], occupied: params[:occupied], user_id: params[:user_id]) 
        ActionCable.server.broadcast('live_feed', {
            post: parking
        })
        if parking.valid?
            render json: parking 
        else 
            render json: event.errors.full_messages, 
            status: 422
        end
    end

    # You SHOULD send back all the information that
    # the react app needs to know whenever a request is
    # successful
    def update
        pp'looking for seller'
        seller = User.find_by!(id: params[:user_id])
        pp seller
        pp'looking for price'
               
        parkingp = Parking.find_by(id: params[:id])
        price = parkingp.price
        # price = params[:balance]
        pp price
        PurchaseParking.update_seller_balance(seller.id, price)
    
        spot = Parking.find_by!(id: params[:id])
        spot.update!(occupied: params[:occupied])
        if spot.valid?
            render json: {spot: spot, seller: seller}
        else 
            render json: message.errors.full_messages, status: 422
        end
    end

     

    def update_buyer
        pp'purchase starting'
        user = params[:user_id]
        pp user
        parkingp = Parking.find_by(id: params[:id])
        price = parkingp.price
        pp price
        parking_id = params[:id]
        PurchaseParking.update_buyer_balance(user, price, parking_id)

        pp 'purchase done'
        spot = Parking.find_by!(id: params[:id])
        spot.update!(occupied: params[:occupied], user_id: params[:user_id])
        if spot.valid?
            render json: {spot: spot, user: user}
        else 
            render json: message.errors.full_messages, status: 422
        end
    end
end
