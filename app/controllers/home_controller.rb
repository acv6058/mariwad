class HomeController < ApplicationController
  layout 'home'
  
  def index
    @banners = Banner.where('featured = ? AND activate = ?', true, true)
    @page = Page.root

    
  end
end
