ActiveAdmin.register Episode do

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
		column "名称", :name
		column "大小", :size
		column "集数", :episode_num
		column "链接1", :url1
		column "链接2", :url2
		column "链接3", :url3
		column "播放次数", :playtime
		column "七牛播放次数", :playtime_qiniu
		column "播放条件", :play_condition
		column "创建时间", :created_at
		column "更新时间", :updated_at
		actions
	end

end
