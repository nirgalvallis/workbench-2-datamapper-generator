
class Table < DbObject
#  attr_accessor :columns, :foreign_keys, :referenced_by_foreign_keys, :indexes
  
  def initialize properties = nil
    
    @columns = Columns.new 
    @foreign_keys = ForeignKeys.new
    @referenced_by_foreign_keys = ForeignKeys.new
    @indexes = Indexes.new
    
    
    super properties
  end
  
  ##
  # Get/Set columns
  def columns
    @columns
  end
  
  def columns=(value)
    raise InvalidClassError.new "columns should only be assigned with a container of 'Column'" unless value.kind_of?(DbContainer) && value.accepted_classes == [Column]
    @columns = value    
  end

  ##
  # Get/Set foreign_keys
  def foreign_keys
    @foreign_keys
  end
  
  def foreign_keys=(value)
    raise InvalidClassError.new "foreign_keys should only be assigned with a container of 'ForeignKey'" unless value.kind_of?(DbContainer) && value.accepted_classes == [ForeignKey]
    @foreign_keys = value    
  end

  ##
  # Get/Set referenced_by_foreign_keys
  def referenced_by_foreign_keys
    @referenced_by_foreign_keys
  end
  
  def referenced_by_foreign_keys=(value)
    raise InvalidClassError.new "@referenced_by_foreign_keys should only be assigned with a container of 'ForeignKey'" unless value.kind_of?(DbContainer) && value.accepted_classes == [ForeignKey]
    @referenced_by_foreign_keys = value    
  end

  ##
  # Get/Set indexes
  def indexes
    @indexes
  end
  
  def indexes=(value)
    raise InvalidClassError.new "@indexes should only be assigned with a container of 'Index'" unless value.kind_of?(DbContainer) && value.accepted_classes == [Index]
    @indexes = value    
  end  

end