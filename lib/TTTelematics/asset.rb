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

      def objects(options = {}, format = 'json')
        validates(options,format)
        request = Request.new(@client)
        response = request.get(ACTION_OBJECTS_METHOD, options, format)
        response.body
      end

      private
      def validates(options, format)
        raise ArgumentError unless Validator.check_keys?(PERMIT_KEYS, options)
        raise TypeError unless Validator.check_type_values?(PERMIT_KEYS, options)
        raise ArgumentError unless Validator.check_format?(format)
        true
      end
    end
  end
end
