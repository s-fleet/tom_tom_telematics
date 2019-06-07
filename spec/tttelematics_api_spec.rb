RSpec.describe TTTelematics::API, "TTTelematics" do
  describe "initialize client incomplete and no attributes"  do
    
    it 'should raise an error with no attributes'  do
      expect do 
        TTTelematics::API::Client.new
      end.to raise(ArgumentError)
    end

    it 'should raise an error with incomplete attributes' do
      expect do 
        TTTelematics::API::Client.new({'api_key': 'xxxxx', 'client': 'eeeeeeee'})
      end.to raise(ArgumentError)
    end

    it 'should raise an error with incorrect attributes' do
      expect do 
        TTTelematics::API::Client.new({
          'api_key' => 'xxxxx', 
          'client'=> 'eeeeeeee', 
          'username' => 'test',
          'badattribue' => 'badattribue'
        })
      end.to raise(ArgumentError)
    end

  end

  describe 'initialize client with params' do
    # should return a client config
    let(:client) do 
      TTTelematics::API::Client.new({
        api_key: 'xxxxxx',
        username: 'alexei',
        account: 'yyyyyyyy'
        password: 'password-encrypted'
      })
    end
    it 'should return a Client Object' do
      expect(client).to be_kind_of_type(Client)
    end

    it 'should a return client with the correct params' do
      expect(client.api_key).not_to be_nil
      expect(client.username).not_to be_nil
      expect(client.password).not_to be_nil
      expect(client.account).not_to be_nil

      expect(client.api_key).not_to be_empty
      expect(client.username).not_to be_empty
      expect(client.password).not_to be_empty
      expect(client.account).not_to be_empty
    end
  end
end
