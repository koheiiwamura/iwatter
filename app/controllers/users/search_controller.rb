class Users::SearchController < ApplicationController
  def index
    if params[:word]
      @users = User.where("concat(nickname, username) LIKE ?", "%#{params[:word]}%")
    else
      @users = User.all
    end
  end

  def find
    if params[:word] = ""
      @users = []
      @all_users = User.all
    else
      @users = User.where("concat(nickname, username) LIKE ?", "%#{params[:word]}%")
    end
  end
end
