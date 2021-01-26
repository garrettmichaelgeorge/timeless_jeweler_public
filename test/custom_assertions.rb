module MiniTest::Assertions
  # MiniTest implementation of Pundit test helper from
  # https://www.thunderboltlabs.com/blog/2013/03/27/testing-pundit-policies-with-rspec/
  def assert_permits(policy, action)
    assert policy.public_send("#{action}?"),
           "#{policy.class} does not permit #{action} on" \
           "#{policy.record} for #{policy.user.inspect}"
  end

  def assert_monetized(obj, *attr_getters)
    attr_getters.each do |attr_getter|
      assert_monetized_each(obj, attr_getter)
    end
  end
  alias assert_monetized_all assert_monetized

  # MiniTest DSL for transforming assertions into spec-style expectations
  self.class.infect_an_assertion :assert_permits, :must_permit, :reverse
  self.class.infect_an_assertion :assert_monetized, :must_monetize, :reverse

  private

  def assert_monetized_each(obj, attr_getter)
    assert_instance_of Money, obj.public_send(attr_getter),
                       "Expected that ##{attr_getter} of #{mu_pp(obj)} would be monetized."
  rescue NoMethodError
    assert_respond_to obj, attr_getter,
                      "Expected that #{obj} would have an attribute named " \
                      "##{attr_getter} but didn't find one.  Does #{obj.class} " \
                      "respond to ##{attr_getter}_cents? Are you sure " \
                      "#{obj.class} is monetizing #{attr_getter}?'"
  end
end
