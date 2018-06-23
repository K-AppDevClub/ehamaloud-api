class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy]

  # GET /scores
  def index
    @scores = Score.order('score DESC').select("id","user_name","score")

    render json: @scores
  end

  # GET /scores/1
  def show
    render json: @score
  end

  def get_voice
    byebug
    @score = Score.find_by(id:params[:id]) 
    if @score.voice then
      send_data @score.voice.data
    else
      send_data ""
    end
  end

  # POST /scores
  def create
    @score = Score.new(score_params)
    if @score.voice and @score.voice.data
      @score.voice.data = @score.voice.data.read
    end

    if @score.save
      render json: @score, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.user_id == params[:user_id] then
      if @score.update(score_params)
        render json: @score
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    if @score.user_id == params[:user_id] then
      @score.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.select("id","user_name","score").find(params[:id])    
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:id,:user_id, :user_name, :score,
        voice_attributes: [:id, :score_id, :data])
    end
end
