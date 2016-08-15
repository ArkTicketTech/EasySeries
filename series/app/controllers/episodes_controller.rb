class EpisodesController < ApplicationController

  def episodes_of_serie

  	@serie = Serie.find(params[:serie_id])
    @episode = @serie.episodes.all
    respond_to do |format|
      format.json { render json: @episode}
    end

  end

end
