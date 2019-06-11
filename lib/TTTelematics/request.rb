module TTTelematics
  module API
    class Request < Base
      require 'faraday'
      require 'byebug'
      LANG = 'en'.freeze
      def get(action, params, format = 'json')
        if (action.is_a?(String)) && 
           !(action.nil?) &&
           !(action.empty?)
           
          params = generate_params(action, params, format)
          response = Faraday.get(BASE_URL, params) 
        else
          raise TypeError
        end
      end
      private
        def generate_params(action, params, format)
           params = params
           params[:action] = action
           params[:outputformat] = format
           params[:account] = @client.account
           params[:api_key] = @client.api_key
           params[:username] = @client.username
           params[:password] = @client.password
           params[:lang] = LANG 
           params
        end
    end
  end
end
