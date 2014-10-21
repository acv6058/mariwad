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
    meta_title = "Mariveles Water District - #{@page.meta_title.blank? ? @page.page_title : @page.meta_title}"
    @meta = { title: meta_title, description: @page.meta_description.blank? ?  '' : @page.meta_description, url: "#{Rails.application.routes.default_url_options[:host]}/#{@page.page_url}" }
    #render json: @meta
  end

  def contacts
    @banners = []
    @page = Page.contact
    @contact = Contact.first
    unless @page.nil?
      @banners = @page.banners
      meta_title = "Mariveles Water District - #{@page.meta_title.blank? ? @page.page_title : @page.meta_title}"
      @meta = { title: meta_title, description: @page.meta_description ? @page.meta_description : '', url: "#{Rails.application.routes.default_url_options[:host]}/#{@page.page_url}" }
    end
  end
end
