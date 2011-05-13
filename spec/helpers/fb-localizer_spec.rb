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
    it "should return en_GB" do
      helper.get_fb_locale("en").should == "en_GB"
    end
  end

  context "when we check for chinese" do
    it "should return zh_CN" do
      helper.get_fb_locale("zh").should == "zh_CN" # simplified Chinese
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

  # Set some priorizations
  context "when we check for english" do
    it "should not return en_GB" do
      FbLocalizer.priorized = { :en => "en_US" }
      helper.get_fb_locale("en").should_not == "en_GB"
    end

    it "should return en_US" do
      FbLocalizer.priorized = { :en => "en_US" }
      helper.get_fb_locale("en").should == "en_US"
    end
  end

  context "when we check for chinese" do
    it "should not return zh_CN" do
      FbLocalizer.priorized = { :zh => "zh_HK" } # switch Hong Kong's chinese
      helper.get_fb_locale("zh").should_not == "zh_CN"
    end

    it "should return zh_HK" do
      FbLocalizer.priorized = { :zh => "zh_HK" } # switch Hong Kong's chinese
      helper.get_fb_locale("zh").should == "zh_HK"
    end
  end
end
