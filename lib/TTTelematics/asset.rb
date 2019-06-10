module TTTelematics
  module API
    class Asset
      PERMIT_KEYS =  { filterstring: 'string', 
                     objectgroupname: 'string', 
                     oungroupedonlye: 'string',
                     objectno: 'string',
                     objectuid: 'string',
                     externalid: 'string'}

      def initialize(client)
        raise TypeError if !(client.is_a?(Client)) 
        @client = client
      end

      def objects(options)
        validates(options)
      end

      private
      def validates(options)
        raise ArgumentError unless Validator.check_keys?(PERMIT_KEYS, options)
        raise TypeError unless Validator.check_type_values?(PERMIT_KEYS, options)
        true
      end
    end
  end
end
