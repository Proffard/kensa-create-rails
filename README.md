## Rails template for your new heroku add-on. Works with kensa gem

this repository is a rails template application for use with the 
Heroku <a href="http://github.com/heroku/kensa">kensa</a> gem

Quickstart:

    > gem install kensa
    > kensa create my_addon --template Proffard/kensa-create-rails
    > cd my_addon
    > bundle install
    > foreman start

In a new window: 

    > cd my_addon
    > kensa test all

All tests should pass.

Open resource test page in browser:

    > kensa test provision
    > kensa sso 1
And you should be in a Heroku Single Sign On session for your brand new addon! 

## Current status: 
- deprovision - working
- provision   - working
- planchange  - working
- POST SSO    - working

##Contributing:

1. Fork it ( http://github.com/Proffard/kensa-create-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run 'rspec' - it will run 'kensa create' command in tmp/ folder with updated template AND runs 'kensa test all'
5. If kensa tests are gereen, then push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
