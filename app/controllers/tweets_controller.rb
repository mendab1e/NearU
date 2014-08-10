class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json?lat1=55.73495&long1=37.58637&lat2=55.73678&long2=37.58946
  def index
    if params[:long1].present? & params[:lat1].present? & params[:long2].present? & params[:lat2].present?
      geo_params = [params[:long1], params[:lat1], params[:long2], params[:lat2]]
      @tweets = Tweet.for_map(*geo_params).limit(1000)
    else
      @tweets = Tweet.all.paginate(:page => params[:page], :per_page => 100)
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/1/edit
  def edit
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:long, :lat, :user_screen_name, :text, :tweet_created_at, :user_id)
    end
end
