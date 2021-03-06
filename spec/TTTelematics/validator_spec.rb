require 'byebug'
RSpec.describe Validator, "Validator values" do
  describe 'validates keys' do
    it 'should return false if keys not valid' do
      permitted_keys = {value1: 'string', value2: 'string', value3: 'integer'} 
      options = {value: 'golii', wrongvalue: 'duuuuuuuu'}
      expect(Validator.check_keys?(permitted_keys, options)).to eq(false)
    end

    it 'should return a true if not error' do
      permitted_keys = {value1: 'string', value2: 'string', value3: 'integer'} 
      options = {value1: "golii", value2: "duuuuuuuu"}
      expect(Validator.check_keys?(permitted_keys, options)).to eq(true)
    end
  end

  describe 'validates type values' do
    it 'should return a false if type value not valid' do
      permitted_keys = {value1: 'string', value2: 'string', value3: 'integer'} 
      options = {value: 1234, value2: nil}
      expect(Validator.check_type_values?(permitted_keys, options)).to eq(false)
    end

    it 'should return a true if value is ok' do
      permitted_keys = {value1: 'string', value2: 'string', value3: 'integer'} 
      options = {value1: 'golii', value2: 'duuuuuuuu'}
      expect(Validator.check_type_values?(permitted_keys, options)).to eq(true)
    end
  end

  describe 'validates format value' do
    it 'shoudl return a false if not valid format' do
      expect(Validator.check_format?('jasson')).to eq(false)
    end

    it 'should return a true if valid formats' do
      expect(Validator.check_format?('json')).to eq(true)
      expect(Validator.check_format?('JSON')).to eq(true)
      expect(Validator.check_format?('Json')).to eq(true)
      expect(Validator.check_format?('csv')).to eq(true)
      expect(Validator.check_format?('CsV')).to eq(true)
    end
  end

end
