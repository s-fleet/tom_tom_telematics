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
        validate_keys?(permitted_keys, options.keys.map(&:to_s))
        validate_values?(PERMIT_KEYS, options)
      end
  end
end
