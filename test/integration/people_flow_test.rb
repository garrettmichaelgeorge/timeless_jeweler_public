require 'test_helper'

class PeopleFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @person = people(:robert)
    @user = users(:bob)

    sign_in @user
  end

  test 'successful show' do
    get person_path(@person)
    assert_template 'people/show'
    assert_select 'h1', @person.full_name
  end

  test 'unsuccessful edit' do
    get edit_person_path(@person)
    assert_template 'people/edit'
    assert_select 'h1', @person.full_name
    patch person_path(@person), params: { person: { first_name:  '',
                                                    email: 'foo@invalid',
                                                    ring_size: 'foobar' } }
    assert_template 'people/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_person_path(@person)
    assert_response :success
    first_name  = 'Foo'
    last_name  = 'Bar'
    patch person_path(@person), params: { person: { first_name:  first_name,
                                                    last_name: last_name,
                                                    ring_size: 8.5 } }
    assert_not flash.empty?
    assert_redirected_to @person
    @person.reload
    assert_equal first_name, @person.first_name
    assert_equal last_name, @person.last_name
  end

  test "person is successfully destroyed" do
    get person_path(@person)
    assert_difference "Person.count", -1 do
      @person.destroy
    end
    assert_raises ActiveRecord::RecordNotFound do
      @person.reload
    end
    # assert_redirected_to people_path
    # assert_template 'people/index'
    # assert_select '#flash'
  end
end
