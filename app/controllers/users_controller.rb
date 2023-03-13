class UsersController < ApplicationController
    APP_SECRET ='ryan'
    before_action :authenticate, only: [:show, :me]
    def me 
        render json: {user: @current_user}, status: 200
    end
    def index 
         render json: User.all, status: 200
    end
    def login 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            token = JWT.encode({user_id: user.id, username: user.username}, APP_SECRET, 'HS256')
            render json: {user:user, token: token}, status: 200
        else 
            render json: {error: 'invalid email or password'}, status: 422
        end
    end
    def create
        user = User.new(email: params[:email], password: params[:password])
        if user.save
            render json: {user: user, token: token}, status: 200 
        else 
            render json: {error: user.errors.full_messages[0], status: 422}
        end
    end
    def show
        user = User.find_by!(id: params[:id])
        pp user
        if @current_user.id == user.id
            render json: {user: user}, status: 200
        else 
            render json: {error: 'This aint you'}, status: 401
        end
    end
    def destroy
        user = User.find_by!(id: params[:id])
        user.destroy
    end
end