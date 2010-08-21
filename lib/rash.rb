class Hash
  
  # Converts all of the keys to strings, optionally formatting key name
  def rubyify_keys!
    keys.each{ |k|
      v = delete(k)
      new_key = k.to_s.to_underscore!
      self[new_key] = v
      v.rubyify_keys! if v.is_a?(Hash)
      v.each{|p| p.rubyify_keys! if p.is_a?(Hash)} if v.is_a?(Array)
    }
    self
  end
 
end

class String
  
  # converts a camel_cased string to a underscore string
  # Same way ActiveSupport does string.underscore
  def to_underscore!
    self.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
  
end

module Hashie
  
  class Rash < Mash
    
    def initialize(source_hash = nil, default = nil, &blk)
      if source_hash
        source_hash.rubyify_keys!
        deep_update(source_hash)
      end
      default ? super(default) : super(&blk)
    end
    
    def initializing_reader(key)
      ck = convert_key(key)
      regular_writer(ck, Hashie::Rash.new) unless key?(ck)
      regular_reader(ck)
    end
    
    protected
    
    def convert_value(val, duping=false) #:nodoc:
      case val
        when ::Hashie::Rash
          val.dup
        when ::Hash
          val = val.dup if duping
          self.class.new(val)
        when Array
          val.collect{ |e| convert_value(e) }
        else
          val
      end
    end
    
  end
  
end
