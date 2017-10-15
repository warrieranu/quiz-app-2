class PagesController < ApplicationController
  
  before_action :set_auth
  
  def index
     @user = User.new
  end
  
  def current_user
        @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  
    private
    helper_method :current_user
    
    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end
    
end
