RSpec.describe TTTelematics::API::Request, "TTTelematics Request" do
  describe 'initialize Asset wrong' do
    it 'should raise an url is not a String and valid http' do
      client = TTTelematics::API::Client.new('apikey','client', 'username', 'password')
      url_integer = 111111111
      url_no_valid = 'ttp:csv.telematics'
      expect do
        request = TTTelematics::API::Request.new(client, url_integer)
      end.to raise_error(TypeError)
      expect do
        request_no_valid = TTTelematics::API::Request.new(client, url_no_valid)
      end.to raise_error(TypeError)
    end
  end
  describe 'call GET' do
    let(:client) { TTTelematics::API::Client.new('apikey','client', 'username', 'password') }
    let(:request) { TTTelematics::API::Request.new(client) }
    it 'should error if url not valid' do
      url_integer = 111111111
      url_no_valid = 'ttp:csv.telematics'
      params = {}
      expect do
       request.get(url_integer, params)
      end.to raise_error(TypeError)
        
      expect do
        request.get(url_no_valid, params)
      end.to raise_error(TypeError)
    end

    pending 'should return an type error TTTelematicError if bad request'
  end
end
