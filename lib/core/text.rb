require 'paint'
def vprint(*args)
 puts args if $verbose
end

TASKS_HELP =
%Q{    encrypt                          Encrypt the message with the given key (AES).
    decrypt                          Decrypt the message with the given key (AES).
    hash                             Hash a given message with SHA-256.
    sum                              Retrieve the SHA-256 checksum of a given file.
    uuid                             Generate a random UUID.
    totp                             Generate a Time-based One Time Password.
    b64e                             Encode data in base64.
    b64d                             Decode base64 data.
    lookup                           Check if a hash has been cracked (hashes.org API key needed).

  #{Paint['Examples', '#95a5a6']}
    #{Paint['$ krypton encrypt "mymessage" "mykey"', '#2ecc71']} => #{Paint['ckhJWXcyTE1leENLOWpBQzJWbElMdz09Cg==', '#95a5a6']}
    #{Paint['$ krypton hash "mymessage"', '#2ecc71']} => #{Paint['S3ONp9WM7/rCMeuUnvWDzp5dxbuSVsOV6bI5AJvRqCc=', '#95a5a6']}
    #{Paint['$ krypton totp "mygreatsecret"', '#2ecc71']} => #{Paint['778501', '#95a5a6']}
}
