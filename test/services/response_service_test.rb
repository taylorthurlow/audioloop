require 'test_helper'

class ResponseServiceTest < ActiveSupport::TestCase
  test 'should create response without state' do
    response = Response.new('some_data', 'a message here')
    assert_raise NotImplementedError do
      response.success?
    end
  end

  test 'should create success response' do
    response = Success.new('some_data', 'a message here')
    assert response.success?
  end

  test 'should create failure response' do
    response = Failure.new('some_data', 'a message here')
    assert !response.success?
  end
end
