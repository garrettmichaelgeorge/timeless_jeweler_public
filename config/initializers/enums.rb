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

raw = File.read(Rails.root.join('config/enums.yml'))
hash = YAML.safe_load(raw)
enums = HashWithIndifferentAccess.new(hash)

enums.each do |key, dictionary|
  dictionary = dictionary.zip(dictionary).to_h if dictionary.is_a?(Array)

  context = Module.new
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

  key = enumify(key)
  const = ENUMS.const_get(key) if ENUMS.const_defined?(key)
  const ||= ENUMS.const_set(key, context)

  dictionary.each do |sub_key, value|
    init_constant(const, sub_key, value)
    init_constant(const, value, sub_key, inverted: true)
  end

  context.keys.freeze
  context.values.freeze
  context.freeze
end

ENUMS.freeze
