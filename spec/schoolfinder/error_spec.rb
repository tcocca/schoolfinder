require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Schoolfinder::Error" do
  
  before do
    mock_get({"f" => "getTestScores", "nces_id" => "450231000564"}, 'failure.json')
    @schoolfinder = Schoolfinder::Client.new('some_key')
  end
  
  it "should return an error" do
    lambda {
      @response = @schoolfinder.test_scores(:nces_id => "450231000564")
    }.should raise_exception(Schoolfinder::Error, "Schoolfinder Error: invalid api key (code: 3)")
  end
  
end
