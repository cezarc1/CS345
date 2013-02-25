class Dessert
  def initialize(name, calories)
   @name = name
    @calories = calories
  end

  def name
    @name
  end

  def name=(newName)
    @name = newName
  end

  def calories
    @calories
  end

  def calories=(newCalories)
    @calories = newCalories
  end

  def healthy?
    if @calories < 200
      return true
    else
      return false
    end
  end
  
  def delicious?
    return true
  end
end

class JellyBean < Dessert

  def initialize(name, calories, flavor)
    @flavor = flavor
    super(name, calories)
  end

  def flavor
    @flavor
  end

  def flavor=(newFlav)
  @flavor = newFlav
  end

  def delicious?
    if(self.flavor.eql? "black licorice") then return false
    else 
      return true
    end
   end
      
end