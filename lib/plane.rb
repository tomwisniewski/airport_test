class Plane

  attr_accessor :status, :id
  
  def initialize(id)
    @id = id
    @status = "flying"
  end

  def landed!
    @status = "landed"
  end
  
  def taken_off!
    @status = "flying"
  end    

end