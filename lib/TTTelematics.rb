require_relative './TTTelematics/validator'

require_relative './TTTelematics/asset'
require_relative './TTTelematics/request' 
require_relative './TTTelematics/client'

class TTTelematic
  def initialize(client)
    raise TypeError if !(client.is_a?(Client)) 
    @client = client
  end
end
