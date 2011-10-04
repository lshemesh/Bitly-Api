require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Bitly::Api do

  let(:api) { Bitly::Api.new }

  before do
    @test_url = "http://www.buywithme.com/ref/ANHV55XX?utm_medium=Social&utm_source=RAFLI"
  end

  context "#get" do
    it "should send a get request to bitly and return success" do
      response = api.get('/shorten', 'longUrl' => @test_url)
      response.code.should == 200
    end
  end

  context "#shorten" do
    it "should be a shortened version of the url" do
      api.shorten(@test_url).should =~ /buyw.me/
    end
  end
end
