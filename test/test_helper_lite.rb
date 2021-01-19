ENV['RAILS_ENV'] ||= 'test'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/spec'
Minitest::Reporters.use!
