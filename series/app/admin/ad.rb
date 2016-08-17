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
			# This will render app/views/admin/posts/comments.html.erb
		end
	end

	member_action :upload_img do
		Ad.find(params[:id])
	end


end
