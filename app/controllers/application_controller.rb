class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    "/myprofile"
   end

  before_filter :the_cart
  private


   def the_cart
    @cart = session[:cart] || {}
  end


   def featured
      @featured = Artist.find_by_featuredartist true
  	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @featured }
  end
  end
end	
