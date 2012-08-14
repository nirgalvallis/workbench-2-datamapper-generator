require 'test/unit'

require_relative './../test_helper'

class DbObjectTest < MiniTest::Unit::TestCase
  
  def setup
    @db_object = FactoryGirl.build(:db_object)
  end
  
  def test_01_test_of_test
    assert @db_object.valid?, "object is invalid: errors = #{@db_object.errors}"
  end
  
end