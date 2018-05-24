class RandomNumberGenerator
  # digitsは欲しい乱数の桁数を渡す
  def initialize(digits)
    @digits = digits
  end

  attr_reader :digits

  def execute
    SecureRandom.hex(argument_for_hex)
    ##SecureRandom.hexの仕様: 欲しい16進数文字列桁数のバイト数を引数に渡す。
  end

  private
  def argument_for_hex
    digits / 2
  end
end

