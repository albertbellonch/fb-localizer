require 'spec_helper'

describe FbLocalizer::FbLocalizerHelpers do
  # TESTS
  # Correct locales
  context "when we check for catalan" do
    it "should return ca_ES" do
      helper.get_fb_locale("ca").should == "ca_ES"
    end
  end

  context "when we check for english" do
    it "should return en_PI" do
      helper.get_fb_locale("en").should == "en_PI"
    end
  end


  # Invalid checks
  context "when we check for spanish" do
    it "should not return ca_ES" do
      helper.get_fb_locale("es").should_not == "ca_ES"
    end
  end

  context "when we check for welsh" do
    it "should not return ca_ES" do
      helper.get_fb_locale("cy").should_not == "ca_ES"
    end
  end
end
