class Heroku::ResourcesController < ApplicationController
  http_basic_authenticate_with name: ENV['HEROKU_USERNAME'], password: ENV['HEROKU_PASSWORD'], except: :show

  # provision
  def create

  end

  # plan change
  def update

  end

  # deprovision
  def destroy

  end

  def show
    @resource = Heroku::Resource.find(resource_params[:id])
  end

  private
  def resource_params
    params.require(:id).permit!
  end
end
