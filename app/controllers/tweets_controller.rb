class TweetsController < ApplicationController
    def index
        @Tweets = Tweet.all.order(id: "DESC")
        logger.debug @Tweets.count
    end
    def new
        @Tweet = Tweet.new
    end
    def create
        if params[:tweet][:image].nil?
            @Tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
        else
            @Tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current,
            image: params[:tweet][:image].read)
        end
        if @Tweet.save
            flash[:notice] = 'ツイートを投稿しました。'
            redirect_to root_path
        else
            render new_tweet_path
        end
    end
    def show
        @Tweet = Tweet.find(params[:id])
    end
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        flash[:notice] = 'ツイートを削除しました。'
        redirect_to root_path
    end
    def edit
        @Tweet = Tweet.find(params[:id])
    end
    def update
        @Tweet = Tweet.find(params[:id])
        if params[:tweet][:image].nil?
            if @Tweet.update(message: params[:tweet][:message])
                flash[:notice] = 'ツイートを編集しました。'
                redirect_to root_path
            else
                render edit_tweet_path
            end
        else
            if @Tweet.update(message: params[:tweet][:message], image: params[:tweet][:image].read)
                flash[:notice] = 'ツイートを編集しました。'
                redirect_to root_path
            else
                render edit_tweet_path
            end
        end
        
    end
    def get_image
        tweet = Tweet.find(params[:id]) 
        send_data tweet.image, disposition: :inline, type: 'image/png'
    end
end
