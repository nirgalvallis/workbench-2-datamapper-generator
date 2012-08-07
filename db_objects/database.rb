

class Database < DbObject
  def initialize properties = nil
    @id = 1
    @name = 'database 1'
    
    @tables = Tables.new

    super properties
  end
  
end