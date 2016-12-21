require "./spec_helper"

module BaseHangul
  # Make `.to_hangul` public
  def self.to_hangul(index)
    previous_def
  end
end

describe BaseHangul do
  describe ".encode" do
    it "returns an empty string with empty binary" do
      encoded = BaseHangul.encode("")
      encoded.should eq("")
    end

    describe "when the length is multiple of 5" do
      it "encodes binary to hangul" do
        encoded = BaseHangul.encode("This is an encoded string")
        encoded.should eq("넥라똔먈늴멥갯놓궂뗐밸뮤뉴뗐뀄굡덜멂똑뚤")
        encoded = BaseHangul.encode("123ab")
        encoded.should eq("꺽먹꼍녜")
        encoded = BaseHangul.encode("123d\0")
        encoded.should eq("꺽먹꼐가")
        encoded = BaseHangul.encode("1234567890")
        encoded.should eq("꺽먹께겔꼍뮷뒝낮")
        encoded = BaseHangul.encode("12345678d\0")
        encoded.should eq("꺽먹께겔꼍뮷듕가")
      end
    end

    describe "when the remainder is 1, 2, 3 when the length is divided by 5" do
      it "encodes binary to hangul with padding" do
        encoded = BaseHangul.encode("1")
        encoded.should eq("꺽흐흐흐")
        encoded = BaseHangul.encode("12")
        encoded.should eq("꺽먈흐흐")
        encoded = BaseHangul.encode("123")
        encoded.should eq("꺽먹꺄흐")
        encoded = BaseHangul.encode("123456")
        encoded.should eq("꺽먹께겔꼍흐흐흐")
        encoded = BaseHangul.encode("1234567")
        encoded.should eq("꺽먹께겔꼍뮨흐흐")
        encoded = BaseHangul.encode("12345678")
        encoded.should eq("꺽먹께겔꼍뮷됩흐")
      end
    end

    describe "when the remainder is 4 when the length is divided by 5" do
      it "encodes binary to hangul" do
        encoded = BaseHangul.encode("123d")
        encoded.should eq("꺽먹꼐빎")
        encoded = BaseHangul.encode("123e")
        encoded.should eq("꺽먹꼐빔")
        encoded = BaseHangul.encode("123f")
        encoded.should eq("꺽먹꼐빕")
        encoded = BaseHangul.encode("123g")
        encoded.should eq("꺽먹꼐빗")
        encoded = BaseHangul.encode("12345678d")
        encoded.should eq("꺽먹께겔꼍뮷듕빎")
        encoded = BaseHangul.encode("12345678e")
        encoded.should eq("꺽먹께겔꼍뮷듕빔")
        encoded = BaseHangul.encode("12345678f")
        encoded.should eq("꺽먹께겔꼍뮷듕빕")
        encoded = BaseHangul.encode("12345678g")
        encoded.should eq("꺽먹께겔꼍뮷듕빗")
      end
    end
  end

  describe ".to_hangul" do
    it "converts index to hangul" do
      (0..1027).each do |index|
        hangul = BaseHangul.to_hangul(index)
        BaseHangul::EUC_KR_TO_UTF_8.index(hangul.ord).should eq(index)
      end
    end

    it "raises IndexError for index out of range" do
      [-100, -1, 1028, 2000].each do |index|
        expect_raises IndexError, "Index #{index} outside of valid range: 0..1027" do
          BaseHangul.to_hangul(index)
        end
      end
    end
  end
end
