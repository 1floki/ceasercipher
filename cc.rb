def ceaser_cypher(str, key, encrypt_or_decrypt)
  if encrypt_or_decrypt == "encrypt"
    #encrption alogrithm here
    str_arr = str.split("")
    char_arr = str_arr.map {|char| char.ord}
    encrypted_arr = char_arr.map do |element|
      if element >= "A".ord && element <= "Z".ord
        (((element - 65 + key) % 25 ) + 65).chr 
      elsif element >= "a".ord && element <= "z".ord
        (((element - 97 + key) % 25 ) + 97).chr 
      else
        element.chr
      end
    end
    encrypted_message = encrypted_arr.join("")
    puts "Your encrypted message is as follows: " 
    puts encrypted_message
  elsif encrypt_or_decrypt == "decrypt"
    #decryption algorithm here
    str_arr = str.split("")
    char_arr = str_arr.map {|char| char.ord}
    decrypted_arr = char_arr.map do |element|
      if element >= "A".ord && element <= "Z".ord
        (((element - 65 - key) % 25 ) + 65).chr 
      elsif element >= "a".ord && element <= "z".ord
        (((element - 97 - key) % 25 ) + 97).chr 
      else
        element.chr
      end
    end
    decrypted_message = decrypted_arr.join("")
    puts "Your encrypted message is as follows: " 
    puts decrypted_message
  else
    "Something unexptected happened at ceaser_cypher method"
  end
end

def encrypt_message()
  puts "Write a message to be encrypted. Note: Only letters will be encrypted!"
  message_to_encrypt = gets.chomp
  puts "Choose a key to encrypt the message. Remember, you'll need this key to decrypt the message."
  key_for_encryption = ""
  loop {key_selection = gets.chomp.to_i; key_for_encryption = key_selection; break if key_selection > 0 && key_selection < 50; puts "Invalid Input. The key should be an integer and greater than 0 and less than 50. Try again!"}
  ceaser_cypher(message_to_encrypt, key_for_encryption, "encrypt")
end

def decrypt_message()
  puts "Write a message to be decrypted!"
  message_to_decrypt = gets.chomp
  puts "Please enter the ceaser cipher key to decrypt the message. Note: Invalid key will be accepted but the output will not be a decrypted message."
  key_for_decryption = ""
  loop {key_selection = gets.chomp.to_i; key_for_decryption = key_selection; break if key_selection > 0 && key_selection < 50; puts "Illegal Input. The key should be an integer and greater than 0 and less than 50. Try again!"}
  ceaser_cypher(message_to_decrypt, key_for_decryption, "decrypt")
end

# Prompts user if they want to encrypt or decrypt
welcome_message = "Welcome, this program will help you encrypt or decrypt a message using ceaser cypher method.\nPlease select one of the following options:\n[1] Encrypt a message\n[2] Decrypt a message"
puts welcome_message

user_selection = ""

loop {selection = gets.chomp.to_i; user_selection = selection; break if selection == 1 || selection == 2; puts "Invalid Input. Try again!"}

if user_selection == 1
  encrypt_message()
elsif user_selection == 2
  decrypt_message()
else
  put "Something strange happened!!"
end

