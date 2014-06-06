class AddCallbackUrlToHerokuResources < ActiveRecord::Migration
  def change
    add_column :heroku_resources, :callback_url, :string
  end
end
