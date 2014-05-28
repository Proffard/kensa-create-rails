class CreateHerokuResources < ActiveRecord::Migration
  def change
    create_table :heroku_resources do |t|
      t.string :email
      t.string :logplex_token
      t.string :plan
      t.string :region
      t.string :heroku_id
      t.text :options

      t.timestamps
    end
  end
end
