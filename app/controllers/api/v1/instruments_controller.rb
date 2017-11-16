class Api::V1::InstrumentsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    @instruments = Instrument.all
    render json: @instruments,each_serializer: Api::V1::InstrumentsSerializer, status: 200
  end
end
