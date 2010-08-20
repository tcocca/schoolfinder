require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RubyifyKeys" do
  
  before do
    @hash1 = {"testOne" => "1", "TestTwo" => "2", :testThree => 3, :TestFour => 4, :testFiveSix => 56}
    @hash1.rubyify_keys!
    @hash2 = {"test_one" => "1", "test_two" => "2", "test_three" => 3, "test_four" => 4, "test_five_six" => 56}
  end
  
  it "should convert camel case-ed keys to underscore-ed keys" do
    @hash1.should == @hash2
  end
  
end
