Rails.application.routes.draw do

  devise_for :resources, class_name: 'Heroku::Resource', path: "sso", path_names: { sign_in: 'login' }

  # sso landing page
  root to: "management#home"

  namespace :heroku do
    resources :resources
  end

end
