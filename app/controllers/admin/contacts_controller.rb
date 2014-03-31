class Admin::ContactsController < ApplicationController

  include Admin::MainModule
  before_filter :set_title

  def set_title
    @title = 'Contact Us Settings'
  end
end
