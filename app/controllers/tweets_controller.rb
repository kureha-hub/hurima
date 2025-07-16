class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tags = Tag.all                        # ビューでタグ一覧を使う場合は最初に取得

        # ① まずベースとなる Relation を用意
        @tweets = Tweet.all

        # ② フリーワード検索（body 内を対象）
        if params[:search].present?
            @tweets = @tweets.where("body LIKE ?", "%#{params[:search]}%")
        end

        # ③ タグで絞り込み（check_box_tag "tag_ids[]" で配列送信）
        if params[:tag_ids].present?
            tag_ids = Array(params[:tag_ids]).reject(&:blank?)   # "":空文字を除外
            @tweets = @tweets.joins(:tags).where(tags: { id: tag_ids }).distinct
        end

        # ④ 最後にページネーションをかける（必ず Relation のまま）
        @tweets = @tweets.page(params[:page]).per(12)

        # ⑤ 新しいタグ追加機能（必要なら残す）
        Tag.create(name: params[:tag]) if params[:tag].present?
    end


    def new
    @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
        redirect_to :action => "show", :id => tweet.id
    else
        redirect_to :action => "new"
    end
end

def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
end

    private
    def tweet_params
        params.require(:tweet).permit(:body,:image, :product_name,:price,:university,:lecture, tag_ids: [])
    end

    def correct_user
        @tweet = Tweet.find(params[:id])
        redirect_to tweets_path, alert: "権限がありません．" unless @tweet.user == current_user
    end
end
