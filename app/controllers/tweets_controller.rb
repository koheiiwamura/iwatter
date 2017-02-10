class TweetsController < ApplicationController
  # before_action :move_to_index, except: :index
  before_action :authenticate_user!, except: :index

  def index
    @user = current_user
    @tweets = Tweet.page(params[:page]).per(10).order("created_at DESC")
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
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

  # def move_to_index
  #   redirect_to new_user_session_path unless user_signed_in?
  # end

end
