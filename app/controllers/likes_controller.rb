class LikesController < ApplicationController
    before_action :authenticate_user!

def index
    @liked_tweets = current_user.liked_tweets.includes(:user)
end
def create
    like = current_user.likes.create(tweet_id: params[:tweet_id])
    respond_to do |format|
        format.json { render json: { like_id: like.id } }
        format.html { redirect_back fallback_location: root_path }
    end
end

def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    like.destroy if like.present?
    respond_to do |format|
        format.json { render json: { message: "deleted" } }
        format.html { redirect_back fallback_location: root_path }
    end
end

end