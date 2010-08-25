module Schoolfinder
  class Error < Exception
    
    attr_reader :code, :error
    
    def initialize(code, error)
      @code = code
      @error = error
      super(message)
    end
    
    def message
      "Schoolfinder Error: #{@error} (code: #{@code})"
    end
    
  end
end
