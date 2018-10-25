<p align="center"><img src="https://raw.githubusercontent.com/cbrnrd/krypton/master/img/krypton-readme-header.png"></p>


## Installation

You can install krypton as a standalone gem:

    $ gem install krypton

Or you can install the `periodic-cli` gem:
    
    $ gem install periodic-cli

## Usage

All krypton functions use the same basic syntax: `krypton [cmd] {[message/secret]{[key]}}`

* `encrypt` - Encrypt a string

        $ krypton encrypt "mymessage" "mykey" 
        mymessage => ckhJWXcyTE1leENLOWpBQzJWbElMdz09Cg==

* `decrypt` - Decrypt a string

        $ krypton decrypt "ckhJWXcyTE1leENLOWpBQzJWbElMdz09Cg" "mykey" 
        ckhJWXcyTE1leENLOWpBQzJWbElMdz09Cg => mymessage

* `hash` - Hash a string or piped data

        $ krypton hash "mymessage"
        mymessage => S3ONp9WM7/rCMeuUnvWDzp5dxbuSVsOV6bI5AJvRqCc=

        $ echo "mymessage" | krypton hash
        mymessage => S3ONp9WM7/rCMeuUnvWDzp5dxbuSVsOV6bI5AJvRqCc=

* `uuid` - Generate a secure [uuid](https://en.wikipedia.org/wiki/Universally_unique_identifier)

        $ krypton uuid
        b6ff36d2-3f7e-4077-8ba5-5066f0a205a5

* `totp` - Generate a [time-based one-time password](https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm)

        $ krypton totp "myawesomesecret"
        myawesomesecret => 997820

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cbrnrd/krypton. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Krypton project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cbrnrd/krypton/blob/master/CODE_OF_CONDUCT.md).


<p align="center">
  <img height="100" width="300" src="https://i.imgur.com/obHmDnX.png">
</p>
