class HomeController < ApplicationController
  layout 'home'
  
  def index
    @banners = Banner.where('featured = ? AND activate = ?', true, true)
    #render :json => @banners
    
  end
end
