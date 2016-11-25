class UsersGrid

  include Datagrid

  scope do
    User.order("users.created_at desc")
  end

  column(:id)
  column(:name)
  column(:email)
  column(:is_admin)
  column(:created_at)
  column(:updated_at)

  filter(:id, :string)
  filter(:email, :string)
  filter(:is_admin, :string)
  filter(:created_at, :date)
  filter(:updated_at, :date)

  column(:actions, :html => true) do |obj|
    render :partial => "users/actions", :locals => {obj: obj}
  end
end
