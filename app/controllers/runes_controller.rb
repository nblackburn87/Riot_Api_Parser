class RunesController < ApplicationController
  before_action :set_rune

  def index
    @runes = Rune.all

    render json: @runes
  end

  def show
    render json: @rune
  end

  def create
    @rune = Rune.new(rune_params)

    if @rune.save
      render json: @rune, status: :created, location: @rune
    else
      render json: @rune.errors, status: :unprocessable_entity
    end
  end

  private
    def set_rune
      binding.pry
      @rune = Rune.find(params[:id])
    end

    def rune_params
      params.require(:rune).permit(
        :riot_id,
        :name,
        :description,
        :rune_tier,
        :image_full,
        :image_group,
        :image_sprite,
        :image_h,
        :image_w,
        :image_x,
        :image_y
      )
    end
end