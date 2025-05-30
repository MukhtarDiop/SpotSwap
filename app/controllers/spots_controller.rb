class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_spot, only: [:show, :update, :destroy]
  before_action :authorize_spot_owner, only: [:update, :destroy]

  def index
    if current_user
      @spots = Spot.where.not(user_id: current_user.id).order(created_at: :desc)
    else
      @spots = Spot.order(created_at: :desc)
    end
    @spots = @spots.where(category: params[:category]) if params[:category].present?
    @spots = @spots.where("address ILIKE ?", "%#{params[:location]}%") if params[:location].present?
    @spots = @spots.where("length >= ?", params[:length]) if params[:length].present?
    @spots = @spots.where("width >= ?", params[:width]) if params[:width].present?
    @spots = @spots.where("height >= ?", params[:height]) if params[:height].present?

    @spots = @spots.order(created_at: :desc)
    respond_to do |format|
        format.turbo_stream do
          render partial: "spots/spots_list", formats: [:html], locals: { spots: @spots }
        end
      format.html # fallback pour accès classique (navigateur)
    end
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window_html: render_to_string(
          partial: "spots/info_window",
          formats: [:html],
          locals: { spot: spot }
        )
      }
    end
  end

  def show
   @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      logger.debug @spot.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @spot.update(spot_params)
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("spot_#{@spot.id}", partial: "spots/card", locals: { spot: @spot })
        }
        format.html { redirect_to profile_path(anchor: "my-spots") }
      end
    else
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("spot_#{@spot.id}", partial: "spots/form", locals: { spot: @spot })
        }
        format.html { render :edit }
      end
    end
  end

  def destroy
    begin
      @spot.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("spot_#{@spot.id}") }
        format.html { redirect_to profile_path(anchor: "my-spots"), notice: "Spot deleted." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("spot_#{@spot.id}", partial: "spots/error", locals: { error: "Cannot delete spot with active bookings" }) }
        format.html { redirect_to profile_path(anchor: "my-spots"), alert: "Cannot delete spot with active bookings" }
      end
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def authorize_spot_owner
    unless @spot.user == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def spot_params
    params.require(:spot).permit(:description, :lat, :long, :length, :width, :height, :category, :rate, :title, :address, photos: [])
  end
end
