class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
#for the whole app, if put before_action: authenticate_user here, cant view any page. need to be logged in. shift the before_action: authenticate_user to specific pages which you dont want public pages
before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :authenticate_user!
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :occupation])
end



end
