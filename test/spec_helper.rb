require 'rubygems'
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/should_syntax'
require 'factories/factories'
require "minitest/rails/shoulda"

class ActiveSupport::TestCase
  self.use_transactional_fixtures = false
end

class ActionController::TestCase
  include Devise::TestHelpers
end

class Ability
  include MiniTest::Assertions

  def must_be_able_to( action, instance)
    assert( can?(action, instance), "Should be able to '#{action}' the '#{instance.to_s}'")
  end

  def must_not_be_able_to( action, instance)
    assert( cannot?(action, instance), "Should not be able to '#{action}' the '#{instance.to_s}'")
  end

end

DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end

# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean
