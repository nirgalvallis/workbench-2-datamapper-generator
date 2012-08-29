

class Database < DbObject
  def initialize properties = nil
    @id = 1
    @name = 'database 1'    
    @tables = Tables.new

    super properties
  end
  
  def tables
    @tables
  end
  
  def tables=(values)
    raise InvalidClassError.new "tables should only be assigned with a container of 'Table'" unless values.kind_of?(DbContainer) && values.accepted_classes == [Table]
    @tables = values
  end
  
  def valid?
    super do
      @errors[:tables] = "tables can only be assigned with a container of 'Table'" unless @tables.accepted_classes == [Table]
    end
  end
  
end