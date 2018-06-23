class VoicesController < ApplicationController
  before_action :set_voice, only: [:show, :update, :destroy]

  # GET /voices
  def index
    @voices = Voice.all

    render json: @voices
  end

  # GET /voices/1
  def show
    render json: @voice
  end

  # POST /voices
  def create
    @voice = Voice.new(voice_params)

    if @voice.save
      render json: @voice, status: :created, location: @voice
    else
      render json: @voice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /voices/1
  def update
    if @voice.update(voice_params)
      render json: @voice
    else
      render json: @voice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /voices/1
  def destroy
    @voice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voice
      @voice = Voice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def voice_params
      params.require(:voice).permit(:score_id, :data)
    end
end
