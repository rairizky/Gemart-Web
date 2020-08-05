Rails.application.routes.draw do

  # admin
  post '/api/v1/login_admin', to: 'users#login_admin'

  get '/api/v1/profile/admin', to: 'admin#profile'
  get '/api/v1/admin/dashboard', to: 'admin#dashboard_data'
  get '/api/v1/admin/propose/supplier', to: 'admin#propose_data_supplier'
  get '/api/v1/admin/propose/gerai', to: 'admin#propose_data_gerai'
  get '/api/v1/admin/data/all_supplier', to: 'admin#all_supplier'
  get '/api/v1/admin/data/all_gerai', to: 'admin#all_gerai'
  get '/api/v1/admin/data/all_user', to: 'admin#all_user'

  # gerai
  post '/api/v1/register_gerai', to: 'users#register_gerai'
  post '/api/v1/login_gerai', to: 'users#login_gerai'

  post '/api/v1/profile/gerai/propose', to: 'gerai#propose_gerai'
  get '/api/v1/profile/gerai/', to: 'gerai#profile'
  post '/api/v1/profile/gerai', to: 'gerai#create_profile'
  get '/api/v1/profile/gerai/list_gerai', to: 'gerai#list_gerai'
  get '/api/v1/profile/gerai/list_gerai/:id/', to: 'gerai#detail_gerai'

  # supplier
  post '/api/v1/register_supplier', to: 'users#register_supplier'
  post '/api/v1/login_supplier', to: 'users#login_supplier'

  post '/api/v1/profile/supplier/propose', to: 'supplier#propose_supplier'
  get '/api/v1/profile/supplier', to: 'supplier#profile'
  post '/api/v1/profile/supplier', to: 'supplier#create_profile'
  get '/api/v1/profile/supplier/list_supplier', to: 'supplier#list_supplier'
  get '/api/v1/profile/supplier/list_supplier/:id/', to: 'supplier#detail_supplier'

  # public
  get '/api/v1/auto_login', to: 'users#auto_login'
  get '/api/v1/main/supplier', to: 'main#list_supplier'

end
