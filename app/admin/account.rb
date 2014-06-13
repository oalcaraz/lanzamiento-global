ActiveAdmin.register Account do
  permit_params :email, :username, :firstname, :lastname, :plan_id, :password, :password_confirmation

  index do
    id_column
    column :email
    column :username
    column :plan
    column :firstname
    column :lastname
    column :address
    column :phone
    actions
  end

  filter :id
  filter :email
  filter :username
  filter :plan
  filter :firstname
  filter :lastname
  filter :address
  filter :phone

  form do |f|
    f.inputs "Account Details" do
      f.input :email
      f.input :username
      f.input :firstname
      f.input :lastname
      f.input :address
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
