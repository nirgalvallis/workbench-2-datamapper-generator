class Column < DbObject
    attr_accessor :type, :auto_increment, :default_value, 
      :is_not_null, :length, :precision, :scale, :comment, 
      :is_foreign_key, :indexes,
      :table
  
  def initialize properties = nil
    @auto_increment = false
    @default_value = nil
    @is_not_null = false
    @is_foreign_key = false
    @indexes = {}
    @table = nil

    super properties
  end
  
  def valid?
    @errors = {}
    
    @errors[:table_is_present] = "'table' is missing" if @table.nil?
    
    super
  end
end