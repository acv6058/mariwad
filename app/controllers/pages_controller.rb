class PagesController < ApplicationController
  layout 'pages'

  def show
    @banners = []
    @page = Page.active.where('page_url = ?', params[:page_url]).first
    unless @page.nil?
    @banners = @page.banners
      if @page.is_full_page?
        render 'pages/full_page', layout: 'blank'
      end
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
