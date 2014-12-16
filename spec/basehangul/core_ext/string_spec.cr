require "../../spec_helper"

describe String do
  describe "#to_bin" do
    it "converts an empty String to an empty String" do
      "".to_bin.should eq("")
    end

    it "converts a String consists of a Char to binary form" do
      "\0".to_bin.should eq("00000000")
      "\1".to_bin.should eq("00000001")
      "\u{7F}".to_bin.should eq("01111111")
      "\u{FF}".to_bin.should eq("11000011" \
                                "10111111")
      "\u0800".to_bin.should eq("11100000" \
                                "10100000" \
                                "10000000")
      "\uFFFF".to_bin.should eq("11101111" \
                                "10111111" \
                                "10111111")
      "\u{100000}".to_bin.should eq("11110100" \
                                    "10000000" \
                                    "10000000" \
                                    "10000000")
      "\u{10FFFF}".to_bin.should eq("11110100" \
                                    "10001111" \
                                    "10111111" \
                                    "10111111")
      "가".to_bin.should eq("11101010" \
                            "10110000" \
                            "10000000")
      "あ".to_bin.should eq("11100011" \
                            "10000001" \
                            "10000010")
    end

    it "converts a String consists of multiple Chars to binary form" do
      "\0\0".to_bin.should eq("00000000" \
                              "00000000")
      "\u{7F}\u{FF}".to_bin.should eq("01111111" \
                                      "11000011" \
                                      "10111111")
      "\u0800\uFFFF".to_bin.should eq("11100000" \
                                      "10100000" \
                                      "10000000" \
                                      "11101111" \
                                      "10111111" \
                                      "10111111")
      "\u{100000}\u{10FFFF}".to_bin.should eq("11110100" \
                                              "10000000" \
                                              "10000000" \
                                              "10000000" \
                                              "11110100" \
                                              "10001111" \
                                              "10111111" \
                                              "10111111")
      "가あ".to_bin.should eq("11101010" \
                              "10110000" \
                              "10000000" \
                              "11100011" \
                              "10000001" \
                              "10000010")
    end
  end
end
