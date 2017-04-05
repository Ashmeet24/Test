ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  config.batch_actions = false
  index :download_links => false 
  config.filters = false
  config.comments = false
 


  index do
    selectable_column
    id_column
    column :email
    #column :current_sign_in_at
   # column :sign_in_count
   # column :created_at
    actions
  end
  
   

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
