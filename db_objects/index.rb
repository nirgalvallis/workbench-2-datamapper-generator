class Index < DbObject
  attr_accessor :type, :is_unique, :is_primary,
    :owner_table, :referenced_columns
    
  def initialize properties = nil
    @type = nil
    @is_unique = false
    @is_primary = false
    @owner_table = nil
    @referenced_columns = Columns.new
  end
end