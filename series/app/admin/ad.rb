ActiveAdmin.register Ad do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
		column :id
		column "链接", :url
		column "图片", :img
		column "开启", :activate
		column "审核", :audit
		column "创建时间", :created_at
		column "更新时间", :updated_at
		actions do |ad|
			link_to('上传图片', upload_img_admin_ad_path(ad))
			# link_to('上传图片', "/ads/upload_img/"+ad)
			# Rails.logger.debug("test")
			# logger.debug ad
			# logger.debug "testtestesttest"
			# This will render app/views/admin/posts/comments.html.erb
		end
	end

	member_action :upload_img, method: [:get, :post] do
		require 'fileutils'
		@ad = Ad.find(params[:id])
		if request.post?
			tmp = params[:file_upload][:my_file]
			# tmp = params[:mytest][:myfile]
			file = File.join("public", tmp.original_filename)
			FileUtils.cp tmp.path, file
			# File.open(Rails.root.join('app', 'assets', 'user_file', 'ads_img'), "wb+") do |f|
			# 	f.write(tmp)
			# end
		else
			# render :json => @ad
		end
		# tmp = params[:file_upload][:my_file].tempfile
		# file = File.join("public", params[:file_upload][:my_file].original_filename)
		# FileUtils.cp tmp.path, file
		# respond_to do |format|
		#   format.json { render :json => @ad }
		# end

	end


end
