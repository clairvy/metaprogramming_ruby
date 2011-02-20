#!/usr/bin/env ruby19

require 'test/unit'
require 'ctwc/check_attributes'

class Person
  include CheckAttributes

  attr_checked :age do |v|
    v >= 18
  end
end

class TestheckedAttributes < Test::Unit::TestCase
  def setup
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 18
    assert_equal 18, @bob.age
  end

  def test_refuse_invalid_values
    assert_raises RuntimeError, 'Invalid attributes' do
      @bob.age = 17
    end
  end
end
