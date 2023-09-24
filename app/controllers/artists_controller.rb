class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @display_attributes = {
      "アーティスト名" => @artist.name,
      "ニックネーム" => @artist.nickname,
      "ジャンル" => @artist.genre,
      "結成日" => @artist.founding_date,
      "初めて見た日" => @artist.first_show_date,
      "メモ" => @artist.memo
    }.select { |_, value| value.present? }
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = current_user.artists.build(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render 'new'
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  def favorites
    @favorite_artists = Artist.where(favorited: true)
  end

  def toggle_favorite
    @artist = Artist.find(params[:id])
    @artist.update!(favorited: !@artist.favorited)
    respond_to do |format|
      format.js
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :nickname, :image, :genre, :memo, :nickname_mode, :favorited, :founding_date, :first_show_date)
  end
end