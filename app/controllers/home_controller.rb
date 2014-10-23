class HomeController < ApplicationController
  layout 'home'
  include ActionView::Helpers::AssetUrlHelper
  def index
    @banners = Banner.where('featured = ? AND activate = ?', true, true)
    @page = Page.where(is_root: true).first
    @meta = { title: 'Mariveles Water District', description: @page.meta_description ? @page.meta_description : '', url: Rails.application.routes.default_url_options[:host], image:  asset_url('assets/mariwad_office.jpg') }
    #render json: @meta#_description
  end
end
