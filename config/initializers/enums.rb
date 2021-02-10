##########################################
# This initializer is not ready for use
# and results in errors because some enum
# values, which will be transformed into
# constants at runtime, begin with numbers
#
return
#
##########################################

module ENUMS; end

def enumify(key)
  key.to_s.parameterize(separator: '_').underscore.upcase.to_sym
end

def init_constant(context, key, value, inverted: false)
  return if context.const_defined?(enumify(key))

  context.const_set enumify(key), value.freeze
  context.keys << key unless inverted
  context.values << value unless inverted
end

# Load config/enums.yml into a single HashWithIndifferenctAccess
raw = File.read(Rails.root.join('config/enums.yml'))
hash = YAML.safe_load(raw)
enums = HashWithIndifferentAccess.new(hash)

enums.each do |key, dictionary|
  dictionary = dictionary.zip(dictionary).to_h if dictionary.is_a?(Array)

  # Create a new module
  context = Module.new

  # Define methods on the module
  def context.keys
    @keys ||= []
  end

  def context.values
    @values ||= []
  end

  def context.[](value)
    return values[keys.index(value)] if keys.include?(value)
    return keys[values.index(value)] if values.include?(value)

    nil
  end

  def context.method_missing(name, *args)
    key = name.to_s.parameterize(separator: '_').underscore.upcase.to_sym
    return super unless const_defined?(key)
    return super unless name.to_s.end_with?('?')

    args.first.to_s == const_get(key).to_s
  end

  def context.respond_to?(name, include_all = false)
    key = name.to_s.parameterize(separator: '_').underscore.upcase.to_sym
    return super unless const_defined?(key)
    return super unless name.to_s.end_with?('?')

    true
  end

  def context.respond_to_missing?(name, include_all)
    key = name.to_s.parameterize(separator: '_').underscore.upcase.to_sym
    return super unless const_defined?(key)
    return super unless name.to_s.end_with?('?')

    true
  end

  # String transformation on key
  key = enumify(key)

  # Define constant based on key, namespaced under ENUMS
  const = ENUMS.const_get(key) if ENUMS.const_defined?(key)
  const ||= ENUMS.const_set(key, context)

  dictionary.each do |_sub_key, _value|
    # Transform each dictionary into a constant
    init_constant(const, sub_key, value)
    init_constant(const, value, sub_key, inverted: true)
  end

  # Ensure constant immutability
  context.keys.freeze
  context.values.freeze
  context.freeze
end

ENUMS.freeze
