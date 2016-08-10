class SeriesController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def create

		@serie = Serie.new(serie_params)
		
		respond_to do |format|
      if @serie.save
        format.json { render :json => @serie }
      else
        format.json { render json: @serie.errors }
      end
    end

	end

	def show

	  @serie = Serie.find(params[:id])

	  respond_to do |format|
	  	format.json {render :json => @serie}
	  end

	end

	def update

		@serie = Serie.find(params[:id])

    respond_to do |format|
      if @serie.update(serie_params)
        format.json { head :no_content }
      else
        format.json { render json: @serie.errors }
      end
    end

  end

  def destroy

  	@serie = Serie.find(params[:id])

    @serie.destroy
    respond_to do |format|
      format.json { head :no_content }
    end

  end

	private

		def serie_params
			params.require(:serie).permit(:img, :name, :playtime, :playtime_qiniu, :play_condition, :series_count)
		end

end
