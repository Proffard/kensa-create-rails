class Heroku::ResourcesController < ApplicationController
  http_basic_authenticate_with name: ENV['HEROKU_USERNAME'], password: ENV['HEROKU_PASSWORD']

  # provision
  def create

  end

  # plan change
  def update

  end

  # deprovision
  def destroy

  end
end
