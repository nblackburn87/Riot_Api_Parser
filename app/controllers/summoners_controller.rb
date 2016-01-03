class SummonersController < ApplicationController
  before_action :set_summoner, only: [:show, :update, :destroy]

  def index
    @summoners = Summoner.all

    render json: @summoners
  end

  def show
    render json: @summoner
  end

  def create
    @summoner = Summoner.new(summoner_params)

    if @summoner.save
      render json: @summoner, status: :created, location: @summoner
    else
      render json: @summoner.errors, status: :unprocessable_entity
    end
  end

  def update
    if @summoner.update(summoner_params)
      render json: @summoner
    else
      render json: @summoner.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @summoner.destroy
  end

  private
    def set_summoner
      @summoner = Summoner.find(params[:id])
    end

    def summoner_params
      params.require(:summoner).permit(:name, :profileIconId, :revisionDate, :summonerLevel)
    end
end
