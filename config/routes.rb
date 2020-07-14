Rails.application.routes.draw do

  # admin
  post '/api/v1/login_admin', to: 'users#login_admin'

  # gerai
  post '/api/v1/register_gerai', to: 'users#register_gerai'
  post '/api/v1/login_gerai', to: 'users#login_gerai'

  # supplier
  post '/api/v1/register_supplier', to: 'users#register_supplier'
  post '/api/v1/login_supplier', to: 'users#login_supplier'

  # home
  get '/api/v1/auto_login', to: 'users#auto_login'

end
