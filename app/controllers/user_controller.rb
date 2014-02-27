class UserController < ApplicationController
	def index
		@users= User.all
		@podcasts = Podcast.all
	end

  def show
  	@podcasts = Podcast.all
    @user = User.find(params[:id])
    @users= User.all
  end
end
