# Load the rails application
require File.expand_path('../application', __FILE__)
require 'FixSoapActionHeaderMiddleware.rb'
# Initialize the rails application
WashOutSample::Application.initialize!
