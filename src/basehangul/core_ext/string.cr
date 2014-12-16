# Extend String class of Crystal core.
class String
  # Format its bytes to binary form. If the length of each binary string is
  # smaller than 8, it pads '0' at the left to make its length to 8.
  #
  # Returns a binary form String which of the length is multiple of 8.
  def to_bin
    bytes.map { |byte| "%08s" % byte.to_s(2) }.join
  end
end
