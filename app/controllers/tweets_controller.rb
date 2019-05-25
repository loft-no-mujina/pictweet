class TweetsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end
  
  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    # redirect_to root_path unless user_signed_in?
    # でも可
    
  end
end

# 
# class TweetsController < ApplicationController

#   before_action :move_to_index, except: :index
#   before_action :set_tweet, only: [:edit, :show, :destroy, :update]

#   def index
#     @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
#   end

#   def new
#     return
#   end

#   def create
#     Tweet.create(tweets_params)
#   end

#   def destroy
#     if @tweet.user_id == current_user.id
#       @tweet.destroy
#     end
#   end

#   def edit
#   end

#   def update
#     if @tweet.user_id == current_user.id
#       @tweet.update(tweet_params)
#     end
#   end

#   def show
#     @comments = @tweet.comments.includes(:user)
#   end

#   private
#   def tweets_params
#     params.permit(:image, :text).merge(user_id: current_user.id)
#   end

#   def move_to_index
#     redirect_to action: :index unless user_signed_in?
#   end

#   def set_tweet
#     @tweet = Tweet.find(params[:id])
#   end

# end
# (部分点)
# それそれの項目で10点ずつ

# @tweet = Tweet.find(params[:id]) の文がdestroy,edit,ypdate,showアクションに書いてあるのでこれをbefore_actionを使ってまとめる

# その時のメソッド名は「set_tweet」が望ましい「set_xxxxxx」という形で変数の初期化を行うべきである

# tweets_paramsの中にcurret_user.idの情報をmergeメソッドで追加することで、createアクションの中身を簡潔に書くことが出来るようになる