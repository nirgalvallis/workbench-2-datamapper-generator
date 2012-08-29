
class Table < DbObject
  attr_accessor :columns, :foreign_keys, :referenced_by_foreign_key, :indexes, :comment, :custom_properties
  
  def initialize properties = nil
    
    @columns = DbContainer.new Column
    @foreign_keys = DbContainer.new
    @indexes = DbContainer.new
    
    super properties
  end
  
  def valid?
    @errors = {}
    
    super
  end

end