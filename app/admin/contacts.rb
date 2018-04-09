ActiveAdmin.register Contact do
  actions :index, :show, :destroy

  index do
    column :id
    column :name
    column :email
    column :created_at
    actions
  end
end
