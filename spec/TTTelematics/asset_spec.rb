RSpec.describe TTTelematics::API::Asset, "TTTelematics Assets" do
  #TTTelematics::API::Asset#objects
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

    it 'should a constant variable for permit keys' do
      expect(TTTelematics::API::Asset::PERMIT_KEYS).to eq(
                    {filterstring: 'string', 
                     objectgroupname: 'string', 
                     oungroupedonlye: 'string',
                     objectno: 'string',
                     objectuid: 'string',
                     externalid: 'string'})
    end

    it 'should return a array objects if arguments it is OK' do
      expect(asset.objects({objectno: 'JETTA'})).not_to be_empty  
    end

    pending 'should return an type error TTTelematicError if bad request'
  end
end
