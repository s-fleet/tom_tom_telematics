#Modules
require_relative './TTTelematics/validator'

#Errors
require_relative './TTTelematics/err'

module TTTelematics
  module API
    class Base
      BASE_URL = 'https://csv.telematics.tomtom.com/extern'.freeze

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

