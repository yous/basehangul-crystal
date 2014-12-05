require "../spec_helper"

describe BaseHangul::Version do
  it "each version is a Number" do
    BaseHangul::Version::MAJOR.should be_a(Number)
    BaseHangul::Version::MINOR.should be_a(Number)
    BaseHangul::Version::PATCH.should be_a(Number)
  end

  describe ".to_s" do
    it "is in the form X.Y.Z" do
      BaseHangul::Version.to_s.split('.').size.should eq(3)
    end

    it "each segment of the string is in the right position" do
      x, y, z = BaseHangul::Version.to_s.split('.')
      x.should eq(BaseHangul::Version::MAJOR.to_s)
      y.should eq(BaseHangul::Version::MINOR.to_s)
      z.should eq(BaseHangul::Version::PATCH.to_s)
    end
  end
end
