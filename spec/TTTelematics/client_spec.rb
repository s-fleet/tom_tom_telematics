RSpec.describe TTTelematics::API, "TTTelematics" do
  describe 'initialize client wrong'  do
    it 'should raise an error with incomplete and no attributes'  do
      expect do 
        TTTelematics::API::Client.new
      end.to raise_error(ArgumentError)
    end

    it 'should raise an error with incorrect type attributes' do
      expect do 
        TTTelematics::API::Client.new('api_key','client', 'username', 1123123)
      end.to raise_error(TypeError)
    end
    
    it 'should raise an error with empty or nil values' do
     expect do
       TTTelematics::API::Client.new('', nil , 'username', '1123123')
     end.to raise_error(TypeError)
    end
  end
end
