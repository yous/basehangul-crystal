module BaseHangul
  # Holds the BaseHangul version information.
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 1

    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
