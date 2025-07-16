class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @liked_tweets = @user.liked_tweets.includes(:user) # ← 追加！
        @tweets = @user.tweets
    end
end
