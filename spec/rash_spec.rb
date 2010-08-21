require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Rash" do
  
  context "string extensions" do
    before do
      @camel_case_strings = ["camelCase", "CamelCase", "stringTwoHumps", "StringHasThreeHumps"]
      @underscore_strings = ["camel_case", "camel_case", "string_two_humps", "string_has_three_humps"]
    end
    
    it "should convert camelcase strings to underscored strings" do
      @camel_case_strings.collect{|s| s.to_underscore!}.should == @underscore_strings
    end
  end
  
  context "hash extensions" do
    before do
      @hash1 = {"testOne" => "1", "TestTwo" => "2", :testThree => 3, :TestFour => 4, :testFiveSix => 56}
      @hash1.rubyify_keys!
      @hash2 = {"test_one" => "1", "test_two" => "2", "test_three" => 3, "test_four" => 4, "test_five_six" => 56}
    end
    
    it "should convert camel case-ed keys to underscore-ed keys" do
      @hash1.should == @hash2
    end
  end
  
end
