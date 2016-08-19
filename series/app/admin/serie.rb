ActiveAdmin.register Serie do

	index do
		column :id
		column "名称", :name
		column "图片", :img
		column "大小", :size
		column "豆瓣", :douban_url
		column "播放次数", :playtime
		column "七牛播放次数", :playtime_qiniu
		column "全局权重", :global_weight
		column "特征权重", :featured_weight
		column "创建时间", :created_at
		column "更新时间", :updated_at
		actions do |serie|
			link_to('上传图片', upload_img_admin_series_path(serie))
		end
	end

	member_action :upload_img, method: [:get, :post] do
		require 'fileutils'
		if request.post?
			tmp = params[:file_upload][:my_file]
			file = File.join("public/user_file/series_img", params[:id])
			FileUtils.cp tmp.path, file
			Serie.update(params[:id], :img => "user_file/series_img/"+params[:id])
		end
	end

end
