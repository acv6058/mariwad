class PagesController < ApplicationController
  layout 'pages'

  def show
    page = Page.active.where('page_url = ?', params[:page_url]).first

    #render :json => page
  end

  def contacts
    @page = Page.contact
  end
end
