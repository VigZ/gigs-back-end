class Api::V1::FansController < ApplicationController

  skip_before_action :authorized, only: [:index, :show, :create]


  def create
    @followed = User.find_by(username: params[:fan][:followed])
    @fan = Fan.new(followed_id: @followed.id, follower_id: params[:fan][:follower_id])
    if @fan.new_record?
      @fan.save
      @user = User.find(@fan.follower_id)
      render json: Api::V1::UsersSerializer.new(@user), status: 200
    else
      render json: { message: "That username or password has already been taken." }, status: 401
    end
  end

end

def destroy
  @user_followed = User.find_by(username: params[:id])
  @user_follower = current_user
  @fan = Fan.find_by(followed_id: @user_followed.id, follower_id: @user_follower.id)
  @fan.destroy
  render json: {message: "Successful"}
end
