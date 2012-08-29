require_relative './../test_helper'

class TableTest < MiniTest::Unit::TestCase
  def setup
    @table = FactoryGirl.build(:table)
  end
  
  def test_factory_table_is_valid
    assert @table.valid?, "table is invalid with errors: #{@table.errors.inspect}"
    assert @table.columns.empty?
    assert @table.foreign_keys.empty?
    assert @table.referenced_by_foreign_keys.empty?
    assert @table.indexes.empty?
  end
  
  def test_initialize_table_with_custom_name
    table = Table.new :name => 'custom_name'
    
    assert_equal 'custom_name', table.name
  end
  
  def test_columns_get_set_work_with_columns
    columns = Columns.new
    columns[:column_1] = Column.new(:name => 'column_1')
    
    assert_equal Hash.new, @table.columns
    @table.columns = columns
    assert_equal columns, @table.columns
  end
  
  def test_columns_set_fails_with_other_collection_type
    indexes = Indexes.new
    
    assert_raises(InvalidClassError) do
      @table.columns = indexes
    end
  end
  
  def test_referenced_by_foreign_keys_get_set_work_with_referenced_by_foreign_keys
    referenced_by_foreign_keys = ForeignKeys.new
    referenced_by_foreign_keys[:fk_1] = ForeignKey.new(:name => 'fk_1')
    
    assert_equal Hash.new, @table.referenced_by_foreign_keys
    @table.referenced_by_foreign_keys = referenced_by_foreign_keys
    assert_equal referenced_by_foreign_keys, @table.referenced_by_foreign_keys
  end
  
  def test_referenced_by_foreign_keys_set_fails_with_other_collection_type
    indexes = Indexes.new
    
    assert_raises(InvalidClassError) do
      @table.referenced_by_foreign_keys = indexes
    end
  end

  def test_foreign_keys_get_set_work_with_foreign_keys
    foreign_keys = ForeignKeys.new
    foreign_keys[:fk_1] = ForeignKey.new(:name => 'fk_1')
    
    assert_equal Hash.new, @table.foreign_keys
    @table.foreign_keys = foreign_keys
    assert_equal foreign_keys, @table.foreign_keys
  end
  
  def test_foreign_keys_set_fails_with_other_collection_type
    indexes = Indexes.new
    
    assert_raises(InvalidClassError) do
      @table.foreign_keys = indexes
    end
  end

  def test_indexes_get_set_work_with_indexes
    indexes = Indexes.new
    indexes[:index_1] = Index.new(:name => 'index_1')
    
    assert_equal Hash.new, @table.indexes
    @table.indexes = indexes
    assert_equal indexes, @table.indexes
  end
  
  def test_indexes_set_fails_with_other_collection_type
    columns = Columns.new
    
    assert_raises(InvalidClassError) do
      @table.indexes = columns
    end
  end

end