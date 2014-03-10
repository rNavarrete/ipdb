require 'feedzirra'
require 'nokogiri'
require 'open-uri'

class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @podcasts = Podcast.all.order('created_at DESC')
    @users= User.all
    @comments = Comment.all
    @podcasts = PgSearch.multisearch(params[:search])
      respond_to do |format|
      format.html
    end
  end

  def show
    @itunes = Nokogiri::HTML(open(@podcast.episodes))
    @itunesdata = @itunes.css('body')
    @episodesdata = @itunes.css('tr.podcast-episode')
    @feed = Feedzirra::Feed.fetch_and_parse(@podcast.episodes)
    @podcast = Podcast.find(params[:id])
    @commentable = @podcast
    @comments = @commentable.comments
    @comment = Comment.new
    @data = Rate.all
  end

  def new
    @podcast = current_user.podcasts.build
  end

  def edit
  end

  def create
    @podcast = current_user.podcasts.build(podcast_params)

    respond_to do |format|
      if @podcast.save
        format.html { redirect_to @podcast, notice: 'Podcast was successfully created.' }
        format.json { render action: 'show', status: :created, location: @podcast }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @podcast.update(podcast_params)
        format.html { redirect_to @podcast, notice: 'Podcast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @podcast.destroy
    respond_to do |format|
      format.html { redirect_to podcasts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_podcast
      @podcast = Podcast.find(params[:id])

    end

    def podcast_params
      params.require(:podcast).permit(:description, :episodes, :name, :image)
    end
end
