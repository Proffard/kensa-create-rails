class Heroku::ResourcesController < ApplicationController
  http_basic_authenticate_with name: ENV['HEROKU_USERNAME'], password: ENV['HEROKU_PASSWORD']
  skip_before_action :verify_authenticity_token

  # provision
  def create
    Rails.logger.info provision_params.inspect
    resource = Heroku::Resource.create! provision_params

    if resource
      render json: {
        :id => resource.id,
        :config => {"MYADDON_URL" => "http://yourapp.com/user"},
        :message => "Add-on provisioned successfully!"
      }
    else
      render json: { error: 'Add-on provision failed' }, status: 500
    end
  end

  # plan change
  def update
    resource = Heroku::Resource.find params[:id]
    resource.update_attributes!(plan: update_plan) if resource
    render json: {}
  end

  # deprovision
  def destroy
    resource = Heroku::Resource.find params[:id]
    resource.destroy if resource
    render text: "ok"
  end

  private

  def provision_params
    params.require(:resource).permit(:heroku_id, :plan, :region, :options, :logplex_token)
  end

  def update_plan
    params.require(:plan)
  end
end
