module Validator
  FORMAT_VALID = ['json', 'csv'].freeze 
  def self.check_keys?(permitted, options)
    permitted_keys = permitted.keys.map(&:to_s)
    option_keys = options.keys.map(&:to_s)
    return (option_keys - permitted_keys).size <= 0
  end

  def self.check_type_values?(permit_keys, values)
    err_flag = true
    values.each do |key, value|
      type = permit_keys[key.to_sym]
      if type == 'string'
        err_flag = (value.is_a?(String)) 
      elsif type == 'integer'
        err_flag = (value.is_a?(Integer)) 
      else
        err_flag = false
      end
      break unless err_flag
    end
    return err_flag
  end

  def self.check_format?(format)
    return FORMAT_VALID.include? format.to_s.downcase
  end
end
