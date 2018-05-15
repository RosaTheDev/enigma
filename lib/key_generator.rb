# this is a file about the egnigma machine from the world war the sequal
class KeyGenerator
  attr_reader :rand_key

  def initialize
    @rand_key = rand(10_000..99_999)
  end
end
