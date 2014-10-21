class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #rescue_from Exception, :with => :server_error

  # def server_error(exception)
  #   ExceptionNotifier.notify_exception(exception,
  #     :env => request.env, :data => {:message => "was doing something wrong"})
  # end
end
