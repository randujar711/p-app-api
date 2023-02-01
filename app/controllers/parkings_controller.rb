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

    def update 
        pp'purchase starting'
        user = User.find_by!(params[:user_id])
        price = params[:price].to_f
        pp price 
        pp user 
        PurchaseParking.update_balance(user, price)

        pp 'purchase done'
        spot = Parking.find_by!(id: params[:id])
        spot.update!(occupied: params[:occupied])
        if spot.valid?
            render json: spot
        else 
            render json: message.errors.full_messages, status: 422
        end
    end
end
