class MasteriesController < ApplicationController
  before_action :set_mastery

  def index
    @masteries = Mastery.all

    render json: @masteries
  end

  def show
    render json: @mastery
  end

  def create
    @mastery = Mastery.new(mastery_params)

    if @mastery.save
      render json: @mastery, status: :created, location: @mastery
    else
      render json: @mastery.errors, status: :unprocessable_entity
    end
  end

  private
    def set_mastery
      @mastery = Mastery.find(params[:id])
    end

    def mastery_params
      params.require(:mastery).permit(
        :riot_id,
        :name,
        :mastery_tree_name,
        :descriptions,
        :prereq,
        :ranks,
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