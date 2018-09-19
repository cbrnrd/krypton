require 'openssl'
require 'aes'

module Krypton
class AESCrypt

  # Taken from https://github.com/Gurpartap/aescrypt/blob/master/lib/aescrypt.rb and improved for newew ruby versions
  def self.encrypt(message, password, outfile='')
    a = Base64.encode64(self.encrypt_data(message.to_s.strip, self.key_digest(password), nil, "AES-256-CBC"))
    File.write(outfile, a) unless outfile == '' || outfile.nil?
    a

  end

  def self.decrypt(message, password, outfile='')
    base64_decoded = Base64.decode64(message.to_s.strip)
    d = self.decrypt_data(base64_decoded, self.key_digest(password), nil, "AES-256-CBC")
    File.write(outfile, d) unless outfile == '' || outfile.nil?
    d
  end

  def self.key_digest(password)
    OpenSSL::Digest::SHA256.new(password).digest
  end

  # Decrypts a block of data (encrypted_data) given an encryption key
  # and an initialization vector (iv).  Keys, iv's, and the data
  # returned are all binary strings.  Cipher_type should be
  # "AES-256-CBC", "AES-256-ECB", or any of the cipher types
  # supported by OpenSSL.  Pass nil for the iv if the encryption type
  # doesn't use iv's (like ECB).
  #:return: => String
  #:arg: encrypted_data => String
  #:arg: key => String
  #:arg: iv => String
  #:arg: cipher_type => String
  def self.decrypt_data(encrypted_data, key, iv, cipher_type)
    aes = OpenSSL::Cipher.new(cipher_type)
    aes.decrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(encrypted_data) + aes.final
  end

  # Encrypts a block of data given an encryption key and an
  # initialization vector (iv).  Keys, iv's, and the data returned
  # are all binary strings.  Cipher_type should be "AES-256-CBC",
  # "AES-256-ECB", or any of the cipher types supported by OpenSSL.
  # Pass nil for the iv if the encryption type doesn't use iv's (like
  # ECB).
  #:return: => String
  #:arg: data => String
  #:arg: key => String
  #:arg: iv => String
  #:arg: cipher_type => String
  def self.encrypt_data(data, key, iv, cipher_type)
    aes = OpenSSL::Cipher.new(cipher_type)
    aes.encrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(data) + aes.final
  end
end
end
