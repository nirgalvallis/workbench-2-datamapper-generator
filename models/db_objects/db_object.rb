class DbObject
  
  def initialize properties = nil
    @errors = {}
    @custom_properties = {}
    @comments = nil

    properties.each do |key, value|
#      warn "Warning: Setting the :id property can have unwanted consequences" if key == :id
      
      if key.is_a?(Symbol)
        if self.respond_to?(key)
          eval("self.#{key} = value")  # defined properties
        else
          @custom_properties[key] = value # undefined properties
        end
      end # ignores non-symbol key values
    end if properties.is_a? Hash
  end
  
  ##
  # id getter and setter
  def id
    @id
  end
  
  def id=(value)
    @id = value
  end
  
  
  ##
  # name getter and setter
  def name
    @name
  end
  
  def name=(value)
    @name = value
  end
  
  ##
  # comments getter and setter
  def comments
    @comments
  end
  
  def comments=(value)
    @comments = value
  end

  ##
  # errors' getter
  def errors
    @errors
  end

  ## 
  # custom_properties' getter
  def custom_properties
    @custom_properties
  end
  
  ## 
  # true if object is valid
  def valid?
    if block_given?
      @errors = {}
      yield
    end

    @errors[:id] = "'id' is missing" if @id.nil?
    @errors[:name] = "'name' is missing" if @name.nil?
    
    is_valid
  end
  
  private
  def is_valid
    @errors.empty?
  end
end