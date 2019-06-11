RSpec.describe TTTelematics::API::Asset, "TTTelematics Assets" do
  #TTTelematics::API::Asset#objects

  describe 'Constants freezed values for config' do
    it 'should a constant variable for permit keys' do
      expect(TTTelematics::API::Asset::PERMIT_KEYS).to eq(
                    {filterstring: 'string', 
                     objectgroupname: 'string', 
                     oungroupedonlye: 'string',
                     objectno: 'string',
                     objectuid: 'string',
                     externalid: 'string'})
    end
    it 'should a const variable for ACTION_OBJECTS_METHOD' do
      expect(TTTelematics::API::Asset::ACTION_OBJECTS_METHOD).to eq('showObjectReportExtern')
    end
  end
  describe 'get objects' do
    let(:client) { TTTelematics::API::Client.new('apikey','client', 'username', 'password') }
    let(:asset) { TTTelematics::API::Asset.new(client) }

    it 'should raise an error if arguments has type errors' do
      expect do
        objects = asset.objects({filter_string: nil, objectno: 1234})
      end.to raise_error(ArgumentError)
    end

    it 'should raise an error if arguments has type errors' do
      expect do
        objects = asset.objects({filterstring: nil, objectno: 1234})
      end.to raise_error(TypeError)
    end

    it 'should return a array objects if arguments it is OK' do
      stub_request(:get, "https://csv.telematics.tomtom.com/?account=username&action=showObjectReportExtern&api_key=apikey&objectno=JETTA&outputformat=json&password=password&username=client").
        #with(
          #headers: {
            #'Accept'=>'*/*',
            #'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            #'User-Agent'=>'Faraday v0.15.4'
          #}).
        to_return(status: 200, body: [{'objectno': 'JETTA'}] , headers: {})
        response = asset.objects({objectno: 'JETTA'})
        expect(response.first[:objectno]).to eq('JETTA')
    end

    pending 'should return an type error TTTelematicError if bad request'
  end
end
