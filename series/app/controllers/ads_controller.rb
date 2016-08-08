class AdsController < ApplicationController
	def new
	end

	def create
		@ad = Ad.new(ad_params)

		@ad.save
		redirect_to @ad
	end

	private
		def ad_params
			params.require(:ad).permit(:url, :img, :audit, :activate, :describe)
		end

end
