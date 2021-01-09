ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/spec'
Minitest::Reporters.use!
