class ParkingsController < ApplicationController
    before_action: update_buyer, only: [:update, :index]

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
        pp'looking for seller'
        seller = User.find_by!(id: params[:id])
        pp seller
        pp'looking for price'
        # spot1 = Parking.find_by(id: params[:id])
        # spot1.price 
        # pp spot1
        price1 = params[:price]
        pp price1
        PurchaseParking.update_seller_balance(seller.id, price1)

        spot = Parking.find_by!(id: params[:id])
        spot.update!(occupied: params[:occupied], user_id: params[:id])
        if spot.valid?
            render json: {spot: spot, seller: seller}
        else 
            render json: message.errors.full_messages, status: 422
        end
    end

    private

    def update_buyer 
        pp'purchase starting'
        user = User.find_by!(id: params[:user_id])
        price = params[:price]
        parking_id = params[:id]
        pp price 
        pp parking_id
        pp'parking id above'
        pp user 
        PurchaseParking.update_buyer_balance(user.id, price, parking_id)

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
