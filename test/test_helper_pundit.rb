require_relative 'test_helper_lite'

# https://gist.github.com/ordinaryzelig/2032303

module MiniTest::Assertions
  # MiniTest implementation of Pundit test helper from
  # https://www.thunderboltlabs.com/blog/2013/03/27/testing-pundit-policies-with-rspec/
  def assert_permits(policy, action)
    assert policy.public_send("#{action}?"),
           "#{policy.class} does not permit #{action} on" \
           "#{policy.record} for #{policy.user.inspect}"
  end

  # MiniTest DSL for transforming assertions into spec-style expectations
  self.class.infect_an_assertion :assert_permits, :must_permit, :reverse
end
