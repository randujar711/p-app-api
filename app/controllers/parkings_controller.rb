class ParkingsController < ApplicationController
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
       parking = Parking.create!(latitude: params[:latitude], longitude: params[:longitude], price: params[:price]) 
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
        pp'purchase starting'
        user = User.find_by!(id: params[:user_id])
        # pp'user'
        price = params[:price]
        # pp'price'
        parking_id = params[:id]
        # pp'parking_id'
        pp price 
        pp parking_id
        pp'parking id above'
        pp user 
        PurchaseParking.update_balance(user.id, price, parking_id)

        pp 'purchase done'
        spot = Parking.find_by!(id: params[:id])
        spot.update!(occupied: params[:occupied], user_id: params[:id])
        if spot.valid?
            render json: {spot: spot, user: user}
        else 
            render json: message.errors.full_messages, status: 422
        end
    end
end
