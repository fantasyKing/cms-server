class AppAppInfoGrid

  include Datagrid

  scope do
    AppAppInfo
  end

  column(:app_id)
  column(:app_name)

  filter(:app_id, :string)
  filter(:app_name, :string)

  column(:actions, :html => true) do |obj|
    render :partial => "db_app/app_infos/actions", :locals => {obj: obj}
  end
end
