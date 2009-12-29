# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include Authentication

  helper :all
  protect_from_forgery # :secret => '738b58c70b917079d70170afab61eff9'
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

end
