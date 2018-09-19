require 'paint'
def vprint(*args)
 puts args if $verbose
end

TASKS_HELP =
%Q{    encrypt                             Encrypt the message with the given key (AES).
    decrypt                             Decrypt the message with the given key (AES).
    hash                                Hash a given message with SHA256.

  #{Paint['Examples', '#95a5a6']}
    #{Paint['$ krypton encrypt "mymessage" "mykey"', '#2ecc71']} #{Paint['=> ckhJWXcyTE1leENLOWpBQzJWbElMdz09Cg==', '#95a5a6']}
    #{Paint['$ krypton hash "mymessage"', '#2ecc71']} => #{Paint['4B738DA7D58CEFFAC231EB949EF583CE9E5DC5BB9256C395E9B239009BD1A827', '#95a5a6']}
}
