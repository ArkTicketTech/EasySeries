ActiveAdmin.register Ad do

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
		end
	end

	member_action :upload_img, method: [:get, :post] do
		require 'fileutils'
		if request.post?
			tmp = params[:file_upload][:my_file]
			file = File.join("public/user_file/ads_img", tmp.original_filename)
			FileUtils.cp tmp.path, file
			Ad.update(params[:id], :img => "user_file/ads_img/"+tmp.original_filename)
		end
	end


end
