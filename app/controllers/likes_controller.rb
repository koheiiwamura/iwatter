class LikesController < ApplicationController
  def create
    @like = Like.create(create_params)
    set_tweet
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: params[:tweet_id])
    @like.destroy
    set_tweet
  end

  def index
    @tweets = current_user.like_tweets.page(params[:page]).per(10).order("id DESC")
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def create_params
    params.permit(:tweet_id).merge(user_id: current_user.id)
  end
end
