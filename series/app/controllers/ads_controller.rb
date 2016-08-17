class AdsController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def new
	end

	def create

		@ad = Ad.new(ad_params)
		
		respond_to do |format|
      if @ad.save
        format.json { render :json => @ad }
      else
        format.json { render json: @ad.errors }
      end
    end

	end

	def show

	  @ad = Ad.find(params[:id])

	  respond_to do |format|
	  	format.html #show.html.erb
	  	format.json {render :json => @ad}
	  end

	end

	def update

		@ad = Ad.find(params[:id])

    respond_to do |format|
      if @ad.update(ad_params)
        format.json { head :no_content }
      else
        format.json { render json: @ad.errors }
      end
    end

  end

  def destroy

  	@ad = Ad.find(params[:id])

    @ad.destroy
    respond_to do |format|
      format.json { head :no_content }
    end

  end

  def get_ad_info

  	@ad = Ad.first
  	respond_to do |format|
  		format.html 
	  	format.json {render :json => @ad}
  	end

  end

  def add_play_time

  	@ad = Ad.find(params[:id])

  	
  end

	private

		def ad_params
			params.require(:ad).permit(:url, :img, :audit, :activate, :describe)
		end

end
