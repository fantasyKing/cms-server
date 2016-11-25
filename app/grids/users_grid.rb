class UsersGrid

  include Datagrid

  scope do
    User
  end

  filter(:id, :integer)
  filter(:name, :string)

  column(:id)
  column(:name)
  column(:email)
end
