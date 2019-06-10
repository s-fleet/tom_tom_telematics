module TTTelematics
  module API
    class Asset < Base
      PERMIT_KEYS =  ({ filterstring: 'string', 
                     objectgroupname: 'string', 
                     oungroupedonlye: 'string',
                     objectno: 'string',
                     objectuid: 'string',
                     externalid: 'string'}).freeze
      ACTION_OBJECTS_METHOD = 'showObjectReportExtern'.freeze

      def objects(options, format = 'json')
        validates(options)
        request = Request.new(@client)
        request.get(ACTION_OBJECTS_METHOD, options, format)
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
