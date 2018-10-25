require 'digest'

module Krypton
class SHA
  def self.hash(data, raw=false)
    return Digest::SHA256.hexdigest(data) if raw
    return Digest::SHA256.base64digest(data)
  end
end
end