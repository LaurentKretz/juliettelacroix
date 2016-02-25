ActiveAdmin.register User do

  permit_params :email, :first_name, :last_name, :admin, :first_purchase

  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :invitation_sent_at
    column :invitation_accepted_at
    column "Premier kit acheté" do |user|
      user.first_purchase
    end
    column "Address" do |user|
      if user.addresses.first.nil?
        "No address registered"
      else
        "#{user.addresses.first.street} #{user.addresses.first.zip_code.to_s} #{user.addresses.first.city}"
      end
    end
    column :admin
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :first_purchase
    end
    f.inputs "Admin" do
      f.input :admin
    end

    f.actions
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
