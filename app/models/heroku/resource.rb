class Heroku::Resource < ActiveRecord::Base
  devise :database_authenticatable, :trackable
end
