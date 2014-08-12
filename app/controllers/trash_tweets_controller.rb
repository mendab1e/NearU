class TrashTweetsController < ApplicationController
  before_action :set_trash_tweet, only: [:show, :edit, :update, :destroy, :add_to_dictionary_and_accept]

  # GET /trash_tweets
  # GET /trash_tweets.json
  def index
    @trash_tweets = TrashTweet.all.paginate(:page => params[:page], :per_page => 100)
  end

  def add_to_dictionary_and_accept
    Tweet.create(text: @trash_tweet.text, long: @trash_tweet.long, lat: @trash_tweet.lat, user_screen_name: @trash_tweet.user_screen_name, user_id: @trash_tweet.user_id, tweet_created_at: @trash_tweet.tweet_created_at)
    text = SemanticAnalyzer.new(@trash_tweet.text).clear_text
    bigrams = SemanticAnalyzer.build_bigrams(text).ngrams_of_all_data[2]
    bigrams.each do |bigram, count|
      dictionary = Dictionary.find_by_bigram(bigram)
      dictionary ||= Dictionary.new(bigram: bigram)
      dictionary.count += count
      dictionary.save
    end
    @trash_tweet.destroy

    redirect_to [:trash_tweets]
  end

  # GET /trash_tweets/1
  # GET /trash_tweets/1.json
  def show
  end

  # GET /trash_tweets/1/edit
  def edit
  end

  # PATCH/PUT /trash_tweets/1
  # PATCH/PUT /trash_tweets/1.json
  def update
    respond_to do |format|
      if @trash_tweet.update(trash_tweet_params)
        format.html { redirect_to @trash_tweet, notice: 'Trash tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @trash_tweet }
      else
        format.html { render :edit }
        format.json { render json: @trash_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trash_tweets/1
  # DELETE /trash_tweets/1.json
  def destroy
    @trash_tweet.destroy
    respond_to do |format|
      format.html { redirect_to trash_tweets_url, notice: 'Trash tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trash_tweet
      @trash_tweet = TrashTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trash_tweet_params
      params.require(:trash_tweet).permit(:long, :lat, :user_screen_name, :text, :tweet_created_at, :user_id)
    end
end
