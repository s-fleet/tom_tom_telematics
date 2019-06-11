RSpec.describe TTTelematics::API::Request, "TTTelematics Request" do
  describe 'call GET' do
    let(:client) { TTTelematics::API::Client.new('apikey','client', 'username', 'password') }
    let(:request) { TTTelematics::API::Request.new(client) }
    it 'should error if action is invalid or nil' do
      action_integer = 111111111
      action_invalid = nil
      action_empty = ''
      params = {}
      expect do
       request.get(action_integer, params)
      end.to raise_error(TypeError)
        
      expect do
        request.get(action_invalid, params)
      end.to raise_error(TypeError)
      
      expect do
        request.get(action_empty, params)
      end.to raise_error(TypeError)
    end

    pending 'should return an type error TTTelematicError if bad request'
  end
end
