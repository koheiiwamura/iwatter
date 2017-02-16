class Users::SearchController < ApplicationController
  def index
    if params[:word]
      @users = User.where("concat(nickname, username) LIKE ?", "%#{params[:word]}%")
    else
      @users = User.all
    end
  end

  def find
    params[:word] == "" ? @users = []: @users = User.where("concat(nickname, username) LIKE ?", "%#{params[:word]}%")
    @all_users = User.all
  end
end
