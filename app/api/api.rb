class API < Grape::API
  prefix 'api'
  format :json
  mount Test::Ping
end
