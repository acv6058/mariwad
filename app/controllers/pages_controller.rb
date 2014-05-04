class PagesController < ApplicationController
  layout 'pages'

  def show
    @page = Page.active.where('page_url = ?', params[:page_url]).first


    #render :json => @page.has_parent?
  end

  def contacts
    @page = Page.contact
    @contact = Contact.first
  end
end
