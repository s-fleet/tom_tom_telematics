module TTTelematics
  module API
    class Asset < TTTelematic
      PERMIT_KEYS =  { filterstring: 'string', 
                     objectgroupname: 'string', 
                     oungroupedonlye: 'string',
                     objectno: 'string',
                     objectuid: 'string',
                     externalid: 'string'}

      def objects(options)
        validates(options)
        request = Request.new(@client)
        request.get()
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
