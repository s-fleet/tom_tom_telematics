Rspec describe TTTelematics::API::Base, 'TTelematic Class Master' do
  describe 'initialize Asset wrong' do
    it 'should raise an error with no arguments' do
      expect do
        TTTelematics::API::Base.new
      end.to raise_error(ArgumentError)
    end

    it 'should raise an error with type errors arguments' do
      expect do
        #client = TTTelematics::API::Client.new('xxxx', 'client', 'username', 'password')
        TTTelematics::API::Base.new(nil)
      end.to raise_error(TypeError)
    end

    it 'should raise an error if client is not kind of Client' do
      expect do
        client = Object.new 
        TTTelematics::API::Base.new(client)
      end.to raise_error(TypeError)
    end
  end