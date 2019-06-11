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
      stub_request(:get, "https://csv.telematics.tomtom.com/extern?account=username&action=showObjectReportExtern&apikey=apikey&lang=en&objectno=JETTA&outputformat=json&password=password&username=client").
        to_return(status: 200, body: [{'objectno': 'JETTA'}].to_json , headers: {})
        response = asset.objects({objectno: 'JETTA'})
        expect(JSON.parse(response).first['objectno']).to eq('JETTA')
    end
  end
end
