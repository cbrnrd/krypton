RSpec.describe Krypton do
  it "has a version number" do
    expect(VERSION).not_to be nil
  end

  it "encrypts correctly" do
    expect(Krypton::AESCrypt.encrypt("mytestmessage", "testkey")).to eq("/1Kj5C9F5pDFnFZT1aRXwQ==\n")
  end

  it "decrypts correctly" do
    expect(Krypton::AESCrypt.decrypt("/1Kj5C9F5pDFnFZT1aRXwQ==\n", "testkey")).to eq("mytestmessage")
  end

  it "hashes correctly" do
    expect(Krypton::SHA.hash("mytestmessage")).to eq("jEEc3X5MEuesHLq0dNvoi5+LvR0tQjYCCUDR7+SuwqE=")
  end

end
