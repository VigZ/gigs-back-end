class Api::V1::SearchController < ApplicationController

  skip_before_action :authorized, only: [:search]

  def search
    @target = params[:search].split('target=')[1].split('?')[0]
    @search_term = params[:search].split('search=')[0].split('?')[0]
    @instrument_options = params[:search]

    case @target
    when "user"
      @instrument_options = trim_options(@instrument_options, "user")
      if @search_term == "" && @instrument_options.length == 0
        @users = User.all
        render json: @users, each_serializer: Api::V1::UsersSerializer, status: 200
      elsif @search_term == "" && @instrument_options.length != 0
          @users = apply_options(@instrument_options,nil,"user")
          render json: @users, each_serializer: Api::V1::UsersSerializer, status: 200
      elsif @search_term != "" && @instrument_options.length == 0
        @users = User.find_each.select { |user| user.username.include?(@search_term) }
        render json: @users, each_serializer: Api::V1::UsersSerializer, status: 200
      elsif @search_term != "" && @instrument_options.length != 0
        @users = apply_options(@instrument_options,@search_term, "user")
        render json: @users, each_serializer: Api::V1::UsersSerializer, status: 200
      end
    when "instrument"
      @instruments = Instrument.find_each.select { |instrument| instrument.name.include?(@search_term) }
      render json: @instruments, each_serializer: Api::V1::InstrumentsSerializer, status: 200
    when "ensemble"
        @instrument_options = trim_options(@instrument_options, "ensemble")
      if @search_term == "" && @instrument_options.length == 0
        @ensembles = Ensemble.all
        render json: @ensembles, each_serializer: Api::V1::EnsemblesSerializer, status: 200
      elsif @search_term == "" && @instrument_options.length != 0
        @ensembles = apply_options(@instrument_options,nil,"ensemble")
        render json: @ensembles, each_serializer: Api::V1::EnsemblesSerializer, status: 200
      elsif @search_term != "" && @instrument_options.length == 0
        @ensembles = Ensemble.find_each.select { |ensemble| ensemble.name.include?(@search_term) }
        render json: @ensembles, each_serializer: Api::V1::EnsemblesSerializer, status: 200
      elsif @search_term != "" && @instrument_options.length != 0
        @ensembles = apply_options(@instrument_options,@search_term,"ensemble")
        render json: @ensembles, each_serializer: Api::V1::EnsemblesSerializer, status: 200
      else
        render json: {error: "There seems to be an error"}, status: 404
      end
    end

  end
end
