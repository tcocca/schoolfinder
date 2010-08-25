require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Schoolfinder::Client" do
  before(:each) do
    @schoolfinder = new_schoolfinder
  end
  
  context "school_search" do
    before do
      mock_get({"f" => "schoolSearch", "zip" => "29601"}, 'school_search.json')
    end
    
    it { lambda {@schoolfinder.school_search(:zip => "29601")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.school_search(:zip => "29601")
      @response.should_not be_nil
      @response.body.should be_kind_of(Array)
    end
  end
  
  context "test_rating" do
    before do
      mock_get({"f" => "getTestRating", "nces_id" => "061029001146"}, 'test_rating.json')
    end
    
    it { lambda {@schoolfinder.test_rating(:nces_id => "061029001146")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.test_rating(:nces_id => "061029001146")
      @response.should_not be_nil
      @response.body.should be_kind_of(Array)
    end
  end
  
  context "student_diversity" do
    before do
      mock_get({"f" => "getStudentDiversity", "nces_id" => "450231000564"}, 'student_diversity.json')
    end
    
    it { lambda {@schoolfinder.student_diversity(:nces_id => "450231000564")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.student_diversity(:nces_id => "450231000564")
      @response.should_not be_nil
      @response.body.should be_kind_of(Hashie::Rash)
    end
  end
  
  context "test_scores" do
    before do
      mock_get({"f" => "getTestScores", "nces_id" => "450231000564"}, 'test_scores.json')
    end
    
    it { lambda {@schoolfinder.test_scores(:nces_id => "450231000564")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.test_scores(:nces_id => "450231000564")
      @response.should_not be_nil
      @response.body.should be_kind_of(Hashie::Rash)
    end
  end
  
  context "teacher_stats" do
    before do
      mock_get({"f" => "getTeacherStats", "nces_id" => "450231000564", "districtleaid" => "4502310"}, 'teacher_stats.json')
    end
    
    it { lambda {@schoolfinder.teacher_stats(:nces_id => "450231000564", :districtleaid => "4502310")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.teacher_stats(:nces_id => "450231000564", :districtleaid => "4502310")
      @response.should_not be_nil
      @response.body.should be_kind_of(Hashie::Rash)
    end
  end
  
  context "student_stats" do
    before do
      mock_get({"f" => "getStudentStats", "nces_id" => "450231000564", "districtleaid" => "4502310", "city" => "Greenville", "state" => "SC"}, 'student_stats.json')
    end
    
    it { lambda {@response = @schoolfinder.student_stats(:nces_id => "450231000564", :districtleaid => "4502310", :city => "Greenville", :state => "SC")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.student_stats(:nces_id => "450231000564", :districtleaid => "4502310", :city => "Greenville", :state => "SC")
      @response.should_not be_nil
      @response.body.should be_kind_of(Hashie::Rash)
    end
  end
  
  context "reviews" do
    before do
      mock_get({"f" => "getReviews", "schoolid" => "25381"}, 'reviews.json')
    end
    
    it { lambda {@schoolfinder.reviews(:schoolid => "25381")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.reviews(:schoolid => "25381")
      @response.should_not be_nil
      @response.body.should be_kind_of(Hashie::Rash)
    end
  end
  
  context "number_of" do
    before do
      mock_get({"f" => "numberOf", "city" => "Greenville", "state" => "SC"}, 'number_of.json')
    end
    
    it { lambda {@schoolfinder.number_of("Greenville", "SC")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.number_of("Greenville", "SC")
      @response.should_not be_nil
      @response.body.should be_kind_of(Array)
    end
  end
  
  context "district_search" do
    before do
      mock_get({"f" => "districtSearch", "city" => "Greenville", "state" => "SC"}, 'district_search.json')
    end
    
    it { lambda {@schoolfinder.district_search(:city => "Greenville", :state => "SC")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.district_search(:city => "Greenville", :state => "SC")
      @response.should_not be_nil
      @response.body.should be_kind_of(Array)
    end
  end
  
  context "branding_data" do
    before do
      mock_get({"f" => "gbd", "nces_id" => "450231000564"}, 'branding_data.json')
    end
    
    it { lambda {@schoolfinder.branding_data(:nces_id => "450231000564")}.should_not raise_exception }
    
    it "should return a response" do
      @response = @schoolfinder.branding_data(:nces_id => "450231000564")
      @response.should_not be_nil
      @response.body.should be_kind_of(Hashie::Rash)
    end
  end
  
end
