Rails.application.routes.draw do

  devise_for :resources, class_name: 'Heroku::Resource', path: "sso", path_names: { sign_in: 'login' }
  get 'management/home'

  # sso landing page
  root to: "heroku/resources_controller#show"


  namespace :heroku do
    resources :resources
  end

end
