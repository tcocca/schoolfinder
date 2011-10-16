module Schoolfinder
  class Response
    
    attr_accessor :body
    
    def initialize(response)
      rash_response(response)
      if self.body.respond_to?('fault_string')
        raise Schoolfinder::Error.new(self.body.fault_code, self.body.fault_string)
      end
    end
    
    private
    
    def rash_response(response)
      if response.is_a?(Array)
        self.body = []
        response.each do |b|
          if b.is_a?(Hash)
            self.body << Hashie::Rash.new(b)
          else
            self.body << b
          end
        end
      elsif response.is_a?(Hash)
        self.body = Hashie::Rash.new(response)
      else
        self.body = response
      end
    end
    
  end
end
