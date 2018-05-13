# this is a comment to keep rubocop quiet
require './lib/encryptor'

class Enigma
  attr_reader :encryptor 

  def initialize
    @encryptor = Encryptor.new
  end
end
