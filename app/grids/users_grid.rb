class UsersGrid

  include Datagrid

  scope do
    User
  end

  column(:id)
  column(:name)
  column(:email)
  column(:is_admin)
  column(:created_at)
  column(:updated_at)

  filter(:id, :string)
  filter(:name, :string)
  filter(:email, :string)
  
  column(:actions, :html => true) do |obj|
    render :partial => "users/actions", :locals => {obj: obj}
  end
end
