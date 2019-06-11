RSpec.describe TTTelematics::API::Request, "TTTelematics Request" do
  describe 'handle errors' do
    let!(:client) { TTTelematics::API::Client.new('badApiKey','badusername', 'badaccount', 'badpassword') }
    let!(:request) { TTTelematics::API::Request.new(client) }
    
    it 'should raise error if request has invalid api_key' do
      stub_request(:get, "https://csv.telematics.tomtom.com/extern?account=badaccount&action=showVehicleReportExtern&apikey=badApiKey&lang=en&objectno=JETTA&outputformat=json&password=badpassword&username=badusername").
        to_return(status: 200, body: ({'errorCode': 1143, 'errMsg': 'API key is invalid'}.to_json), headers: {})
      expect do
        request.get('showVehicleReportExtern', {objectno: "JETTA"})
      end.to raise_error(TTTelematics::Err::InvalidAPIKey)
    end

    it 'should raise error if request has invalid user, password or account' do
      stub_request(:get, "https://csv.telematics.tomtom.com/extern?account=badaccount&action=showVehicleReportExtern&apikey=badApiKey&lang=en&objectno=JETTA&outputformat=json&password=badpassword&username=badusername").
        to_return(status: 200, body: {'errorCode': 1101, 'errMsg': 'User does not exist'}.to_json , headers: {})
      expect do
        request.get('showVehicleReportExtern', {objectno: "JETTA"})
      end.to raise_error(TTTelematics::Err::InvalidUser)
    end

    it 'should raise error if action is not valid' do
      stub_request(:get, "https://csv.telematics.tomtom.com/extern?account=badaccount&action=showVehicleReportExtern&apikey=badApiKey&lang=en&objectno=JETTA&outputformat=json&password=badpassword&username=badusername").
        to_return(status: 200, body: {'errorCode': 55, 'errMsg': 'action is not valid'}.to_json , headers: {})
      expect do
        request.get('showVehicleReportExtern', {objectno: "JETTA"})
      end.to raise_error(TTTelematics::Err::InvalidAction)
    end

  end
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
  end
end
