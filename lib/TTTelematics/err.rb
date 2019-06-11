module TTTelematics
  module Err
    class InvalidAPIKey < StandardError 
      def message
        'action is not valid'
      end
    end

    class InvalidUser < StandardError
      def message
        'User does not exist'
      end
    end

    class InvalidAction < StandardError
      def message
        'action is not valid'
      end
    end
  end
end
