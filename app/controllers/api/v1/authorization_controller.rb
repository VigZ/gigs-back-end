class Api::V1::AuthorizationController < ApplicationController

  skip_before_action :authorized, only: [:create]

   def create
     @user = User.find_by(username: user_login_params[:username])
     if @user && @user.authenticate(user_login_params[:password])
       token = encode_token({ user_id: @user.id })
       render json: { username: @user.username, jwt: token, id: @user.id }, status: 202
     else
       render json: { message: "Invalid username or password" }, status: 401
     end
   end

   def verify
     @user = current_user
     @token = auth_header.split(" ")[1]
     render json: { username: @user.username, jwt: @token, id: @user.id }, status: 202
   end


   private

   def user_login_params
     params.require(:user).permit(:username, :password)
   end

end
