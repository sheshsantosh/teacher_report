class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_teacher!
  # allow_browser versions: :modern
  allow_browser versions: { safari: 16.4, firefox: 121, ie: false }
end
