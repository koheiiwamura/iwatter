class TweetsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user = current_user
    @tweets = Tweet.page(params[:page]).per(10).order("created_at DESC")
    @tweet = Tweet.new
    respond_to do |format|
      format.html { render :index }
      format.json {
        tweets = @tweets.map do |tweet|
          tweet.json_tweet
        end
        render json: tweets
      }
    end
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      @tweets = Tweet.page(params[:page]).per(10).order("created_at DESC")
    else
      flash[:alert] = "140文字以上で入力してください   ※半角・全角問わず"
      redirect_to action: :index, alert: 'メッセージを投稿できませんでした'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body).merge(user_id: current_user.id)
  end

end
