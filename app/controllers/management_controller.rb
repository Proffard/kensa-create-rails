class ManagementController < ApplicationController
  before_filter :authenticate_resource!
  def home
    @resource = current_resource
  end
end
