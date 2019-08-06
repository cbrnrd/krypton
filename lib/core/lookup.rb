# This software uses the Hashes.org API. It is used to respect the work of all who help Hashes.org keep running.
module Krypton
class Lookup

  def self.lookup(hash, key)
    base_url = "https://hashes.org/api.php?key=#{key}&query=#{hash}"

    # Fire off the request and objectify it
    results = JSON.parse(HTTP.get(base_url).to_s)

    # First check if it was successful

    if results["status"] == "error"
      puts "Error in hash lookup: #{results["errorMessage"]}"
      exit 1
    end

    unless results["status"] == "success"
      puts "Error in hash lookup: request failed"
      exit 1
    end

    # It was successful, now check if it yielded any valid results
    # An example result looks like this
    # {
    # "status":"success",
    # "result":{
    #   "739c5b1cd5681e668f689aa66bcc254c":{
    #      "plain":"test",
    #      "hexplain":"74657374",
    #      "algorithm":"MD5X5PLAIN"
    #   },
    #   "319a96b23c3e875a9a1491a6ba4d46de7495ea35":null
    # }
    # }

    # Just get the results section (it's an array)
    hashes = results["result"]

    hashes.each do |r|
      # r looks like this for a valid hash:
      #   {"hash" => {"plain"=>"password", "hexplain"=>"70617373776f7264", "algorithm"=>"SHA1"}}
      # and like this for an invalid hash
      #   {"hash" => nil}

      # If a hash wasn't found
      if r[1].nil?
        puts "Could not find result for hash #{r[0]}."
      else
        puts
        puts "Result found:"
        puts "  Hash: #{Paint[r[0], '#2ecc71']}"
        puts "  Plaintext: #{Paint[r[1]["plain"], '#2ecc71']}"
        puts "  Algorithm: #{Paint[r[1]["algorithm"], '#2ecc71']}"
      end

      exit 0
    end
  end
end
end