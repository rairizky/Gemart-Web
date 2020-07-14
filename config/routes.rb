Rails.application.routes.draw do

  post '/api/v1/register_gerai', to: 'users#register_gerai'
  post '/api/v1/login_gerai', to: 'users#login_gerai'

  post '/api/v1/register_supplier', to: 'users#register_supplier'
  post '/api/v1/login_supplier', to: 'users#login_supplier'

  get '/api/v1/auto_login', to: 'users#auto_login'
end
