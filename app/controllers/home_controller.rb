class HomeController < ApplicationController
  layout 'home'
  
  def index
    @banners = Banner.where('featured = ? AND activate = ?', true, true)
    @page = Page.root
    @meta = { title: 'Mariveles Water District', description: @page.meta_description }
  end
end
