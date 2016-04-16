=begin

  DEFINE a program keyboard_fix that takes as input a string (AWERTY keys typed) and returns a string(typed keys converted to QWERTY)

  Start by creating a database of all the conversions needed to change a phrase from AZERTY to QWERTY.

  Break the string apart into characters, convert each one individually, and then put the characters back together to form the new phrase.

=end

def keyboard_fix()
  # initialize a hash with the keys being AZERTY and the values being the QWERTY equivalents.
  translation = {"a" => "q","A" => "Q","z" => "w","Z" => "W","q" => "a","Q" => "A","w" => "Z","?" => "M","," => "m","²" => "`","&" => "|","|" => "!","é" => "2","2" => "@","~" => "2","ç" => "9","^" => "9","9" => "(","}" => "=","○" => "_","]" => "-",")" => "-","\"" => "3","#" => "3","3" => "#","'" => "4","{" => "4","4" => "$","(" => "5","[" => "5","5" => "%","-" => "6","1" => "6","6" => "^","è" => "7","`" => "7","7" => "&","_" => "8","\\" => "8","8" => "*","à" => "0","@" => "0","0" => ")","\"" => "{","$" => "]","£" => "}","M" => ":","m" => ";","ù" => "'","%" => "\"","*" => "\\","μ" => "|",";" => ",","." => "<",":" => ".","/" => ">","!" => "/","§" => "?", " " => " ", "hhh" => "h", "HHH" => "H"
  }

  # initialize the method by asking for user input.
  puts "Hello. I am the AZERTY to QWERTY converter. Please type the phrase for me to convert to normal"
  phrase = gets.chomp
  #split the input into individual characters so each can be converted to QWERTY
  phrase = phrase.split("")

  #use an iterator to implement the translations. Note that map is needed to destructively change the array elements
  phrase.map do |letter|
    if translation[letter].nil? == false
      phrase[phrase.index(letter)] = translation[letter]
    else
    end
  end

  #join the individual characters back together into a single string
  phrase = phrase.join("")

  sleep(0.5)
  puts "."
  sleep(0.5)
  puts "."
  sleep(0.5)
  puts "."

  puts "Thanks for waiting. Your translated phrase is #{phrase}."

end

keyboard_fix()