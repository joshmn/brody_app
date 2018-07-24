class ApplicationController < ActionController::Base

  require_dependency 'application_controller/devise_dependency'

  before_action :authenticate_user!, unless: -> { devise_controller? }
  layout 'main'

  helper_method :set_title
  def set_title(title)
    @title = title
  end

  def smart_title
    controller = if params[:controller].index('/')
                   params[:controller].split('/').last
                 else
                   params[:controller]
                 end
    name = controller.demodulize.classify
    if params[:action] == 'index'
      set_title "My #{name.pluralize}"
    elsif %w[new create].include?(params[:action])
      set_title "New #{name}"
    elsif %w[edit update].include?(params[:action])
      set_title "Edit #{name}"
    else
      set_title '### NO TITLE SET ###'
    end
  end
end
