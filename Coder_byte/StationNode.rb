class StationNode
  
  def initialize(gas_to_leave)  
    @gas_to_leave = gas_to_leave
    @routes = []
  end
  
  def add_route_to other
    routes << other   
  end
  
end