Rails.application.routes.draw do

  # sso landing page
  get "/"
  post '/sso/login'

  namespace :heroku do
    # sso sign in
    #get "/heroku/resources/:id"
    resources :resources
  end

end
