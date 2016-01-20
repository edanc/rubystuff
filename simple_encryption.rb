command = ARGV[0]
message = ARGV[1]
key     = ARGV[2]

class SimpleEncryption
  attr_reader :message, :letters, :keys, :invert, :key

  def initialize(message, key)
    @message = message.downcase.delete(" ")
    @letters = [*('a'..'z')]
    @key = key.to_i
    @keys = {}

    @letters.to_enum.with_index(1) do |l, index|
      @keys[l]= index
    end
    @invert = @keys.invert
  end

  def encrypt
    new_message = ""
    message.split("").each do |char|
      value = keys.fetch(char)
      new_value = new_number(value)
      new_message += invert.fetch(new_value, " ")
    end
    new_message
  end

  def decrypt
    new_message = ""
    message.split("").each do |char|
      value = keys.fetch(char)
      new_value = old_number(value)
      new_message += invert.fetch(new_value, " ")
    end
    new_message
  end

  def new_number(num)
    (num + key) % 26
  end

  def old_number(num)
    (num - key) % 26
  end
end

case command
when "encrypt"
  puts SimpleEncryption.new(message, key).encrypt
when "decrypt"
  puts SimpleEncryption.new(message, key).decrypt
else
  puts "error\n"

  puts "example: ruby simple_encryption encrypt 'hi' 3 "
end
