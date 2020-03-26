# Modules
require 'TTTelematics/validator'

# Errors
require 'TTTelematics/err'

require 'TTTelematics/version'

module TTTelematics
  module API
    class Base
      BASE_URL = 'https://csv.telematics.tomtom.com/extern'.freeze

      def initialize(client)
        raise TypeError unless client.is_a?(Client)

        @client = client
      end
    end
  end
end

# classes
require 'TTTelematics/asset'
require 'TTTelematics/request'
require 'TTTelematics/client'
