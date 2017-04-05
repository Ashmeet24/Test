ActiveAdmin.register User do
	
	config.filters = false
	config.batch_actions = false
	permit_params :email, :first_name, :last_name, :phone,:password
config.comments = false
	index do 
		selectable_column
		column :first_name
		column :last_name
		column :email
		column :role

		actions 
	end

	form do |f|
		f.inputs 'Details' do
		f.input :email
		#f.input :name
		f.input :password
		f.input :password_confirmation
		f.input :role
	end
	f.actions
end

show do 
	attributes_table do 
		row :email
		row :name
		row :phone
		row :dob
	end
end
	
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

end
