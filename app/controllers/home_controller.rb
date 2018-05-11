class HomeController < ApplicationController
	before_action :creat_client
	

	def index
		batch_size = 10
	    @twitter_handle = @client.user   
  		
	end



  	def lo_tweets
	 	batch_size = 10
	    @tweets = @client.user_timeline(@twitter_handle).take(batch_size)    
	    @friends = @client.friends(@twitter_handle).take(batch_size)
		@followers = @client.followers(@twitter_handle).take(batch_size)
		
	end
 
  	private

  	def home_params
  		params.require(:home).permit(:keywork)
  	end

	def creat_client
	    @client = Twitter::REST::Client.new do |config|
	      config.consumer_key        = Rails.application.secrets.twitter_api_key
	      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
	      config.access_token        = current_user.token
	      config.access_token_secret = current_user.secret
	    end 
	  end
end

