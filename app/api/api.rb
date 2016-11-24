class API < Grape::API
  prefix 'api'
  format :json
  mount Test::Ping
  mount UserApi::List
end
