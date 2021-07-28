require "../spec_helper"

describe BaseHangul::Utils do
  describe ".to_bin" do
    it "converts an empty String to an empty String" do
      BaseHangul::Utils.to_bin("").should eq("")
    end

    it "converts a String consists of a Char to binary form" do
      BaseHangul::Utils.to_bin("\0").should eq("00000000")
      BaseHangul::Utils.to_bin("\1").should eq("00000001")
      BaseHangul::Utils.to_bin("\u{7F}").should eq("01111111")
      BaseHangul::Utils.to_bin("\u{FF}").should eq("11000011" \
                                                   "10111111")
      BaseHangul::Utils.to_bin("\u0800").should eq("11100000" \
                                                   "10100000" \
                                                   "10000000")
      BaseHangul::Utils.to_bin("\uFFFF").should eq("11101111" \
                                                   "10111111" \
                                                   "10111111")
      BaseHangul::Utils.to_bin("\u{100000}").should eq("11110100" \
                                                       "10000000" \
                                                       "10000000" \
                                                       "10000000")
      BaseHangul::Utils.to_bin("\u{10FFFF}").should eq("11110100" \
                                                       "10001111" \
                                                       "10111111" \
                                                       "10111111")
      BaseHangul::Utils.to_bin("가").should eq("11101010" \
                                               "10110000" \
                                               "10000000")
      BaseHangul::Utils.to_bin("あ").should eq("11100011" \
                                               "10000001" \
                                               "10000010")
    end

    it "converts a String consists of multiple Chars to binary form" do
      BaseHangul::Utils.to_bin("\0\0").should eq("00000000" \
                                                 "00000000")
      BaseHangul::Utils.to_bin("\u{7F}\u{FF}").should eq("01111111" \
                                                         "11000011" \
                                                         "10111111")
      BaseHangul::Utils.to_bin("\u0800\uFFFF").should eq("11100000" \
                                                         "10100000" \
                                                         "10000000" \
                                                         "11101111" \
                                                         "10111111" \
                                                         "10111111")
      BaseHangul::Utils.to_bin("\u{100000}\u{10FFFF}").should eq("11110100" \
                                                                 "10000000" \
                                                                 "10000000" \
                                                                 "10000000" \
                                                                 "11110100" \
                                                                 "10001111" \
                                                                 "10111111" \
                                                                 "10111111")
      BaseHangul::Utils.to_bin("가あ").should eq("11101010" \
                                                 "10110000" \
                                                 "10000000" \
                                                 "11100011" \
                                                 "10000001" \
                                                 "10000010")
    end
  end

  describe ".chunks" do
    describe "with empty string" do
      it "returns an empty array" do
        [1, 5, 100].each do |size|
          chunks = BaseHangul::Utils.chunks("", size)
          chunks.should eq([] of String)
        end
      end
    end

    describe "with string of which length is multiple of size" do
      it "returns an array of chunks" do
        [
          {"foo", 1, ["f", "o", "o"]},
          {"foobarbaz", 3, ["foo", "bar", "baz"]},
        ].each do |example|
          str, size, expected = example
          chunks = BaseHangul::Utils.chunks(str, size)
          chunks.should eq(expected)
        end
      end
    end

    describe "with string of which length is not multiple of size" do
      it "returns an array of chunks" do
        [
          {"abcd1234A", 4, ["abcd", "1234", "A"]},
          {"abcd1234AB", 4, ["abcd", "1234", "AB"]},
          {"abcd1234ABC", 4, ["abcd", "1234", "ABC"]},
        ].each do |example|
          str, size, expected = example
          chunks = BaseHangul::Utils.chunks(str, size)
          chunks.should eq(expected)
        end
      end
    end

    describe "with invalid size" do
      it "raises ArgumentError" do
        [0, -1, -5].each do |size|
          expect_raises ArgumentError, "Invalid slice size" do
            BaseHangul::Utils.chunks("foo", size)
          end
        end
      end
    end
  end
end
