module TTTelematics
  module API
    class Client
      attr_reader :api_key, :username, :account, :password
      def initialize(api_key, username, account, password)
        raise TypeError unless validate_options?(api_key, username, account, password)
        @api_key = api_key
        @username = username
        @account = account 
        @password = password 
      end

      def asset
        Asset.new(self)
      end

      private
      def validate_options?(*args)
        flag = true
        args.each do |a|
          flag = (!a.nil? && a.class == String && !a.empty?)
          break unless flag
        end
        return flag
      end
    end
  end
end
