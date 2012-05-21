class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :current_user_session, :current_user
  
  before_filter :instantiate_controller_and_action_names
  before_filter :require_user, :except => [:index, :sort, :show]
	
	def instantiate_controller_and_action_names
	      @current_action = action_name
	      @current_controller = controller_name
	      @events = Event.find_for_home('Event', 'asc')
	end 

	# for new, edit, create and update page titles
	def set_page_title(title)
		@page_title = @current_action.titleize + title
	end
	  
  def help
    Helper.instance
  end

  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
  end
  
  helper_method :admin?    


   protected  
   def admin?  
     current_user ? true : false
   end    

	private
		def current_user_session
			return @current_user_session if defined?(@current_user_session)
			@current_user_session = UserSession.find
		end

		def current_user
			return @current_user if defined?(@current_user)
			@current_user = current_user_session && current_user_session.user
		end
		
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to root_url
        return false
      end
    end
 
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
	
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
