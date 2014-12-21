require "../spec_helper"

describe BaseHangul::Utils do
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
          {"foobarbaz", 3, ["foo", "bar", "baz"]}
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
          {"abcd1234ABC", 4, ["abcd", "1234", "ABC"]}
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
