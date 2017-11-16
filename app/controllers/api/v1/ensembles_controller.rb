class Api::V1::EnsemblesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  def index
    @ensembles = Ensemble.all
    render json: @ensembles,each_serializer: Api::V1::EnsemblesSerializer, status: 200
  end

  def show
    @ensemble = Ensemble.find_by(name: params[:id])
    render json: Api::V1::EnsemblesSerializer.new(@ensemble), status: 200
  end
end
