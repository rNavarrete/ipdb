ActiveAdmin.register Podcast do
  permit_params :description, :name, :image_file_name,:image_url
  active_admin_importable
  index do
    column :Name
    column :description
    column :id
    default_actions

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
