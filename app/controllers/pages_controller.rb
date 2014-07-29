class PagesController < ApplicationController
  layout 'pages'

  def show
    @banners = []
    @page = Page.active.where('page_url = ?', params[:page_url]).first
    unless @page.nil?
    @banners = @page.banners
    end


    #render :json => @page.has_parent?
  end

  def contacts
    @banners = []
    @page = Page.contact
    @contact = Contact.first
    unless @page.nil?
      @banners = @page.banners
    end
  end
end
