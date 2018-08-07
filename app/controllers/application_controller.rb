class ApplicationController < ActionController::Base
    # Redirect user to home page with a message when access of
    # another user is denied.
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_url, alert: exception.message
    end
end
