require 'spec_helper'
require 'heroku/kensa/http'
require 'heroku/kensa/manifest'
require 'heroku/kensa/check'
require 'heroku/kensa/sso'
require 'heroku/kensa/post_proxy'
require 'heroku/kensa/screen'
require 'heroku/kensa/git'
require 'heroku/kensa/client'
require 'heroku/kensa/okjson-support'

describe "kensa create --template rails" do
  it "clones and bootstrap ready for push addon app" do
    Heroku::Kensa::Git.stub(:clone_url).and_return Dir.pwd

    Dir.chdir 'tmp'
    `rm -rf myaddon`
    
    Heroku::Kensa::Client.new([:create, 'myaddon'], {template: 'Proffard/kensa-create-rails'}).run!
    server = fork { exec "foreman start" }
    puts 'Starting server...'
    sleep 5

    Heroku::Kensa::Client.new([:test, 'all']).run!

    puts "Killing server..."
    Process.kill 'TERM', server
    Process.wait  server
    `rm -rf myaddon`
  end
end
