def caesar_cipher(text, shift)
  return nil if text.count('a-zA-Z').zero?

  shift = normalise_shift(shift)
  text.each_char.with_index do |char, index|
    current_char_ascii = char.ord
    if small_letter?(current_char_ascii) || capital_letter?(current_char_ascii)
      shifted_index = current_char_ascii + shift
      max_last_index = capital_letter?(current_char_ascii) ? 90 : 122
      min_first_index = capital_letter?(current_char_ascii) ? 65 : 97
      shifted_index -= 26 if shifted_index > max_last_index
      shifted_index += 26 if shifted_index < min_first_index
      text[index] = shifted_index.chr
    end
  end
end

def small_letter?(character)
  character.between?(97, 122)
end

def capital_letter?(character)
  character.between?(65, 90)
end

def normalise_shift(shift)
  positive = shift.positive?
  if !positive && (shift < -26)
    shift += 26 while shift < -26
  end

  if positive && (shift > 26)
    shift -= 26 while shift > 26
  end
  shift
end


print 'Enter the string to encode : '
text = gets.chomp

print 'Enter the shift factor : '
shift = gets.chomp.to_i


result = caesar_cipher(text, shift)
if result.nil?
  print 'Invalid input'
else
  print "Encoded string: #{result}"
end


