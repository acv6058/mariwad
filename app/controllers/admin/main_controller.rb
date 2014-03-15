class Admin::MainController < ApplicationController
	
	include Admin::MainModule
	before_filter :set_title
	
	def set_title
	  @title = 'Dashboard'
	end
	
	def index
    
	end
	
end
