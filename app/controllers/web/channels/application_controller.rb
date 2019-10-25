class Web::Channels::ApplicationController < ApplicationController
  before_action :authenticate_user!
  helper_method :resource_channel

  def resource_channel
    @resource_channel ||= Team::Channel.friendly.find(params[:channel_id])
  end
end
