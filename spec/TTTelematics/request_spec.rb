RSpec.describe TTTelematics::API::Request, "TTTelematics Request" do
  describe 'handle errors' do
    let!(:client) { TTTelematics::API::Client.new('badApiKey','badclient', 'badusername', 'badpassword') }
    let!(:request) { TTTelematics::API::Request.new(client) }
    
    it 'should raise error if request has invalid api_key' do
      stub_request(:get, "https://csv.telematics.tomtom.com/?account=badusername&action=showObjectReportExtern&api_key=badApikey&objectno=JETTA&outputformat=json&password=badpassword&username=badclient").
        #with(
          #headers: {
            #'Accept'=>'*/*',
            #'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            #'User-Agent'=>'Faraday v0.15.4'
          #}).
        to_return(status: 200, body: {'errCode': 1143, 'errMsg': 'API key is invalid'} , headers: {})
      expect do
        request.get('showVehicleReportExtern', {objectno: "Jetta"})
      end.to raise_error(TTTelematics::Err::InvalidAPIKey)
    end

    it 'should raise error if request has invalid user, password or account' do
      stub_request(:get, "https://csv.telematics.tomtom.com/?account=badusername&action=showObjectReportExtern&api_key=badApikey&objectno=JETTA&outputformat=json&password=badpassword&username=badclient").
        #with(
          #headers: {
            #'Accept'=>'*/*',
            #'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            #'User-Agent'=>'Faraday v0.15.4'
          #}).
        to_return(status: 200, body: {'errCode': 1101, 'errMsg': 'User does not exist'} , headers: {})
      expect do
        request.get('showVehicleReportExtern', {objectno: "Jetta"})
      end.to raise_error(TTTelematics::Err::InvalidUser)
    end

    it 'should raise error if action is not valid' do
      stub_request(:get, "https://csv.telematics.tomtom.com/?account=badusername&action=showObjectReportExtern&api_key=badApikey&objectno=JETTA&outputformat=json&password=badpassword&username=badclient").
        #with(
          #headers: {
            #'Accept'=>'*/*',
            #'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            #'User-Agent'=>'Faraday v0.15.4'
          #}).
        to_return(status: 200, body: {'errCode': 55, 'errMsg': 'action is not valid'} , headers: {})
      expect do
        request.get('showVehicleReportExtern', {objectno: "Jetta"})
      end.to raise_error(TTTelematics::Err::InvalidUser)
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
