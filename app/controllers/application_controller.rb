class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
	  def generate_username(first_name, last_name)
			first_name + last_name
		end

		def generate_password(first_name, last_name)
			'@' + first_name + '.' + last_name
		end
  # before_action :authenticate_user!
end
