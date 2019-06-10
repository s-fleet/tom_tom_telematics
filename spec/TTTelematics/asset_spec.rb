RSpec.describe TTTelematics::API::Asset, "TTTelematics Assets" do
  describe 'initialize Asset wrong' do
    it 'should raise an error with no arguments' do
      expect do
        TTTelematics::API::Asset.new
      end.to raise_error(ArgumentError)
    end

    it 'should raise an error with type errors arguments' do
      expect do
        #client = TTTelematics::API::Client.new('xxxx', 'client', 'username', 'password')
        TTTelematics::API::Asset.new(nil)
      end.to raise_error(TypeError)
    end

    it 'should raise an error if client is not kind of Client' do
      expect do
        client = Object.new 
        TTTelematics::API::Asset.new(client)
      end.to raise_error(TypeError)
    end

    it 'should raise an error if optional arguments has type errors' do
      client = TTTelematics::API::Client.new('apikey','client', 'username', 'password') 
      expect do
        TTTelematics::API::Asset.new(client)
      end.to raise_error(TypeError)
    end
  end
  #TTTelematics::API::Asset#objects
  describe 'get objects' do
    let(:client) { TTTelematics::API::Client.new('apikey','client', 'username', 'password') }
    let(:asset) { TTTelematics::API::Asset.new(client) }

    it 'should raise an error if arguments has type errors' do
      #filter_string = String
      #object_group_name = String
      #ungrouped_only = String
      #objectno = String
      #objectuid = String
      #externaluid = String
      expect do
        objects = asset.objects({filter_string: nil, objectno: 1234})
      end.to raise_error(TypeError)
    end

    it 'should raise an error if arguments has type errors' do
      #filter_string = String
      #object_group_name = String
      #ungrouped_only = String
      #objectno = String
      #objectuid = String
      #externaluid = String
      expect do
        objects = asset.objects({filter_string: nil, objectnrito: '12314'})
      end.to raise_error(ArgumentError)
    end

    it 'should a constant variable for permit keys' do
      expect(TTTelematics::API::Asset::PERMIT_KEYS).to eq(
        ['filterstring', 
         'objectgroupname', 
         'oungroupedonly',
         'objectno',
         'objectuid',
         'externalid'])
    end

    it 'should return a array objects if arguments it is OK' do
      expect(asset.objects({objectno: 'JETTA'})).not_to be_empty  
    end

    pending 'should return an type error TTTelematicError if bad request' do
    end
  end
end
