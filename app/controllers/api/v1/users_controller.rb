class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:index, :show, :create, :update]

  def index
    @users = User.all
    render json: @users, each_serializer: Api::V1::UsersSerializer, status: 200
  end

  def create
   @user = User.new(user_params)
   if @user.new_record?
     @user.save
     token = encode_token({ user_id: @user.id })
     render json: { username: @user.username, jwt: token, id: @user.id }, status: 202
   else
     render json: { message: "That username or password has already been taken." }, status: 401
   end
  end


  def show
      @user = User.find_by(username: params[:id])
      render json: Api::V1::UsersSerializer.new(@user), status: 200
  end

def update
    @user = User.find_by(username: params[:id])
    @user.update(LFG: !@user[:LFG])
end

private

def user_params
  params.require(:user).permit(:username, :password, :email)
end
end
