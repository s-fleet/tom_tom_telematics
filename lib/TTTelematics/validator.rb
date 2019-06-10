module Validator
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
      end
      break unless err_flag
    end
    return err_flag
  end
end
