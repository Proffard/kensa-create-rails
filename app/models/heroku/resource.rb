class Heroku::Resource < ActiveRecord::Base
  self.table_name = 'heroku_resources'
  devise  :database_authenticatable, :trackable, :heroku_sso
end
