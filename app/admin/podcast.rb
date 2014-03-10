ActiveAdmin.register Podcast do
  permit_params :description, :name, :image_file_name,:image_url, :episodes, :user_id
  active_admin_importable
  index do
    column :name
    column :description
    column :id
    
 default_actions
end

  form do |f|
    f.inputs "Company Details" do
      f.input :name
      f.input :episodes
      f.input :description
      f.input :image_file_name
      f.input :image_url
      f.input :user_id, :as => :select, :collection => User.joins('').map{|u| [u.first_name + ' ' + u.last_name, u.id]} 
    end
    f.actions
  end  



  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
