require 'paint'
def vprint(*args)
 puts args if $verbose
end

TASKS_HELP =
%Q{    encrypt                             Encrypt the message with the given key (AES).
    decrypt                             Decrypt the message with the given key (AES).
    hash                                Hash a given message with SHA256.
    uuid                                Generate a random UUID.

  #{Paint['Examples', '#95a5a6']}
    #{Paint['$ krypton encrypt "mymessage" "mykey"', '#2ecc71']} #{Paint['=> ckhJWXcyTE1leENLOWpBQzJWbElMdz09Cg==', '#95a5a6']}
    #{Paint['$ krypton hash "mymessage"', '#2ecc71']} => #{Paint['S3ONp9WM7/rCMeuUnvWDzp5dxbuSVsOV6bI5AJvRqCc=', '#95a5a6']}
}
