class EpisodesController < ApplicationController

  def episodes_of_serie

  	@serie = Serie.find(params[:serie_id])
    @episode = @serie.episodes.all
    respond_to do |format|
      format.json { render json: @episode}
    end

  end

  def add_playtime

  	@episode = Episode.find(params[:episode_id])
  	@serie = Serie.find(@episode.serie_id)

  	@serie.increment!(:playtime)
  	@episode.increment!(:playtime)

		respond_to do |format|
      format.json { render json: @serie}
    end  	

  end

end
