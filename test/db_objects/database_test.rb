require_relative './../test_helper'

class DatabaseTest < MiniTest::Unit::TestCase
  
  def setup
    @database = FactoryGirl.build(:database)
  end
  
  def test_factory_database_is_valid
    assert @database.valid?, "database is invalid with errors: #{@database.errors.inspect}"
    assert_equal 1, @database.id
    assert_equal 'database 1', @database.name
    assert @database.tables.empty?
  end
  
  def test_initialize_database_with_custom_name
    database = Database.new :name => 'custom name'
    
    assert_equal database.name, 'custom name'
  end
  
  def test_tables_get_set_work_with_tables
    tables = Tables.new
    tables[:table_1] = Table.new(:name => 'table 1')

    assert_equal Hash.new, @database.tables
    @database.tables = tables
    assert_equal tables, @database.tables
  end
  
  def test_tables_set_fails_with_other_collection_type
    columns = Columns.new

    assert_raises(InvalidClassError) do
      @database.tables = columns
    end 
  end
  
  def test_assert_custom_properties_are_added
    database = Database.new :custom => 'custom value'
    
    assert_equal({:custom => 'custom value'}, database.custom_properties)
  end
  
end
