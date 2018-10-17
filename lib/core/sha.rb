require 'digest'

module Krypton
  class SHA
    def self.hash(data, raw=false)
      if raw
        return Digest::SHA256.hexdigest(data)
      else
        return Digest::SHA256.base64digest(data)
      end
    end
  end
end