module BaseHangul
  # Helper methods for BaseHangul.
  module Utils
    # Slice a string into chunks of a given size.
    #
    # str  - The String to slice.
    # size - The Integer max size of each chunk.
    #
    # Examples
    #
    #   chunks("foo", 1)
    #   # => ["f", "o", "o"]
    #
    #   chunks("foobarbaz", 3)
    #   # => ["foo", "bar", "baz"]
    #
    #   chunks("abcd1234AB", 4)
    #   # => ["abcd", "1234", "AB"]
    #
    #   chunks("", 1)
    #   # => []
    #
    # Returns an Array of Slice of chunked Strings.
    # Raises ArgumentError if the size is smaller than or equal to 0.
    def self.chunks(str, size)
      raise ArgumentError.new("Invalid slice size") if size <= 0
      new_str = str.clone
      array = [] of String
      (0...str.size).step(size) do |index|
        array << str[index...index + size]
      end
      array
    end
  end
end
