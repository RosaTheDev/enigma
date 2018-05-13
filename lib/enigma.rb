require './lib/encryptor'
# this is a comment to keep rubocop quiet
class Enigma
  attr_reader :encryptor

  def initialize
    @encryptor = Encryptor.new
  end
end
