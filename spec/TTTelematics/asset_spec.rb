RSpec.describe TTTelematics::API::Asset, "TTTelematics Assets" do
  describe 'initialize Asset wrong' do
    it 'should raise an error with incomplete and no attributes' do
      expect do
        TTTelematics::API::Asset.new
      end.to raise_error(ArgumentError)
    end
  end
end
