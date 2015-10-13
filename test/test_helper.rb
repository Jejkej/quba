ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all

	# Return true if a test user is logged in.
	def is_logged_in?
		!session[:user_id].nil?
	end

	# Logs in a test user.
	def log_in_as(user, options = {})
		password		= options[:password] 		|| 'password'
		remember_me	= options[:remember_me]	|| '1'
		if integration_test?
			post login_path, session: { email:		user.email,
																	password: password,
																	remember_me: remember_me }
		else
			session[:user_id] = user.id
		end
	end

	def sample_file(filename = "sample_file.png")
		File.new("test/fixtures/#{filename}")
	end

	private
		
		# Returns true insite an integration test.
		def integration_test?
			defined?(post_via_redirect)
		end
	
end
