require 'digest'

module Krypton
class SHA
  def self.hash(data, raw=false)
    return Digest::SHA256.hexdigest(data) if raw
    Digest::SHA256.base64digest(data)
  end

  def self.checksum(filepath, raw=false)
    unless File.exist?(filepath)
      puts "Error: File not found at " + filepath
      return 1
    end

    return Digest::SHA256.hexdigest(File.read(filepath)) if raw
    Digest::SHA256.base64digest(File.read(filepath))
  end
end
end
