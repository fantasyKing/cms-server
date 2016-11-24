module UserApi
  class List < Grape::API
    desc 'Returns users'
    get :list do
      User.all
    end
  end
end
