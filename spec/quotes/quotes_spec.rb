require 'helper'

describe "Quotes" do
  it "should return the AAPL quote when requested" do
    q = Quotes.get("AAPL")
    q["AAPL"].should_not == nil
  end
  
  it "should return a hash of 3 quotes when 3 quotes are requested" do
    q = Quotes.get("AAPL", "GOOG", "MSFT")
    q.size.should == 3
  end
  
  it "should raise an ArgumentError when there are no arguments" do
    lambda { Quotes.get() }.should raise_error(ArgumentError)
  end
  
  it "should raise an ArgumentError if any of the quotes requested are blank" do
    lambda { Quotes.get("AAPL", "", "MSFT") }.should raise_error(ArgumentError)
    lambda { Quotes.get("") }.should raise_error(ArgumentError)
  end
end