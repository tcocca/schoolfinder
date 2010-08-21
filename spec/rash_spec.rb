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
  
  context "rash" do
    before do 
      @original_hash = {
        "varOne" => 1, 
        "two" => 2, 
        :three => 3, 
        :varFour => 4, 
        "fiveHumpHumps" => 5, 
        :nested => {
          "NestedOne" => "One", 
          :two => "two",
          "nested_three" => "three"
        },
        "nestedTwo" => {
          "nested_two" => 22,
          :nestedThree => 23
        }
      }
      @rash = Hashie::Rash.new(@original_hash)
    end
    
    it "should create a new rash where all the keys are underscored instead of camelcased" do
      @rash.var_one.should == 1
      @rash.two.should == 2
      @rash.three.should == 3
      @rash.var_four.should == 4
      @rash.five_hump_humps.should == 5
      @rash.nested.nested_one.should == "One"
      @rash.nested.two.should == "two"
      @rash.nested.nested_three.should == "three"
      @rash.nested_two.nested_two.should == 22
      @rash.nested_two.nested_three.should == 23
    end
  end
  
end
