module Schoolfinder
  class Client
    
    include HTTParty
    base_uri 'api.education.com'
    format :json
    
    def initialize(api_key)
      self.class.default_params :key  => api_key
      self.class.default_params :sn   => 'sf'
      self.class.default_params :resf => 'json'
      self.class.default_params :v    => '3'
    end
    
    def school_search(optional_params = {})
      params = {:f => 'schoolSearch'}
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
      params.merge!(options) unless options.blank?
      Schoolfinder::Response.new(self.class.get('/service/service.php', :query => params))
    end
    
  end
end
