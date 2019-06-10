#Modules
require_relative './TTTelematics/validator'

module TTTelematics
  module API
    class Base
      def initialize(client)
        raise TypeError if !(client.is_a?(Client)) 
        @client = client
      end
    end
  end
end

#classes
require_relative './TTTelematics/asset'
require_relative './TTTelematics/request' 
require_relative './TTTelematics/client'

