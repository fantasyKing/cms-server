class API < Grape::API
  prefix 'api'
  format :json
  mount GrapeTest::Ping
  mount UserApi::List
end
