class ApplicationController < ActionController::Base
  before_action :redirect_to_new_version!

  def remote_ip
    request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end

  private

  def redirect_to_new_version!
    redirect_to "https://toocoolcats.com/"
  end

  def page
    params[:page] || 1
  end

  def per
    params[:per] || 10
  end
end
