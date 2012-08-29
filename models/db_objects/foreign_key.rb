class ForeignKey < DbObject
  attr_accessor :mandatory, :many, 
    :referenced_table, :referenced_columns, :owner_table, :owner_columns,
    :reversed_name 
    
  def initialize properties = nil
    @mandatory = false
    @many= false
    @referenced_table = nil
    @referenced_columns = Columns.new
    @owner_table = nil
    @owner_columns = Columns.new
    @reversed_name = nil
    
    super properties
  end
  
  def valid?
    errors = {}
    errors[:referenced_table_is_present] = "'referenced_table' is missing" if @referenced_table.nil?
    errors[:referenced_columns_are_present] = "'referenced_columns' is empty" if @referenced_columns.empty?
    errors[:owner_table_is_present] = "'owner_table' is missing" if @owner_table.nil?
    errors[:owner_columns_are_present] = "'owner_columns' is empty" if @owner_columns.empty?
    
    super
  end

end
