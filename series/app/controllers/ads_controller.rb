class AdsController < ApplicationController
	def new
	end

	def create
		@ad = Ad.new(ad_params)
		@ad.save
		redirect_to @ad
	end

	def show
		
	  @ad = Ad.find(params[:id])

	  respond_to do |format|
	  	format.html #show.html.erb
	  	format.json {render :json => @ad}
	  end

	end

	private
		def ad_params
			params.require(:ad).permit(:url, :img, :audit, :activate, :describe)
		end

end
