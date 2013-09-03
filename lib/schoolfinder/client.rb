module Schoolfinder
  class Client

    include HTTParty
    base_uri 'api.education.com'
    format :json

    attr_accessor :http_timeout

    def initialize(api_key, http_timeout = nil)
      self.class.default_params :key  => api_key
      self.class.default_params :sn   => 'sf'
      self.class.default_params :resf => 'json'
      self.class.default_params :v    => '5'
      self.http_timeout = http_timeout
    end

    def school_search(optional_params = {})
      params = {:f => 'schoolSearch'}
      make_request(params, optional_params)
    end
    
    def assigned_schools(optional_params = {})
      params = {:f => 'getAssignedSchools'}
      make_request(params, optional_params)
    end

    def test_rating(options)
      params = {:f => 'getTestRating'}
      make_request(params, options)
    end

    def student_diversity(options)
      params = {:f => 'getStudentDiversity'}
      make_request(params, options)
    end

    def test_scores(options)
      params = {:f => 'getTestScores'}
      make_request(params, options)
    end

    def teacher_stats(options)
      params = {:f => 'getTeacherStats'}
      make_request(params, options)
    end

    def student_stats(options)
      params = {:f => 'getStudentStats'}
      make_request(params, options)
    end

    def reviews(options)
      params = {:f => 'getReviews'}
      make_request(params, options)
    end

    def number_of(city, state)
      params = {:f => 'numberOf', :city => city, :state => state}
      make_request(params)
    end

    def district_search(options)
      params = {:f => 'districtSearch'}
      make_request(params, options)
    end

    def branding_data(optional_params = {})
      params = {:f => 'gbd'}
      make_request(params, optional_params)
    end

    private

    def make_request(params, options = {})
      params.merge!(options) unless options.empty?
      http_params = {}
      unless params.empty?
        http_params[:query] = params
      end
      unless self.http_timeout.nil?
        http_params[:timeout] = self.http_timeout
      end
      Schoolfinder::Response.new(self.class.get('/service/service.php', http_params))
    rescue Timeout::Error
      Schoolfinder::Response.new({"faultCode" => 0, "faultString" => "a timeout occured", "faultType" => "error"})
    end

  end
end
