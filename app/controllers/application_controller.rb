class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def generated_token
    loop do
      token = SecureRandom.urlsafe_base64(32)
      break token unless Payment.exists?(token: token)
    end
  end
  helper_method :generated_token
end
