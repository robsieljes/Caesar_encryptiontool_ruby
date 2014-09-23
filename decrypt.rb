puts "Give number of ceasar encryption (minimal 1, maximal 24)"
caesar_number = gets.chomp.to_i

if caesar_number < 1 || caesar_number > 24
	puts "give a number between 1 and 24"
	caesar_number = gets.chomp
	caesar_number = caesar_number
end

puts "Do you want to read text from file? (choose yes or no)"
yes_or_no = gets.chomp.downcase

if yes_or_no == 'yes'
	puts "Give location and name of your file (spaces will be deleted)"
	location = gets.chomp
	crypto = File.read(location).delete(" ")
elsif yes_or_no == 'no'
	puts "Give password for encryption"
	crypto = gets.chomp.delete(" ")
end

# Make array a - z to compare
crypt_array = ("a".."z").to_a

#String where decrypted words are added
decrypted_string = ''

n = 0

while n < crypto.length do
	i = 0
	while i <= 25 do
		# Compare a-z with crypted words
		if crypt_array[i] === crypto[n]
			if i <= 26-caesar_number
				decrypted_string = decrypted_string + crypt_array[i + caesar_number].to_s		
			end
			if i >= 26-caesar_number
				decrypted_string = decrypted_string + crypt_array[i - caesar_number].to_s
			end
			# End the while loop
			i = 26
		else
		i += 1
		end
	end
	# Make sure i is set to zero
	i = 0
	n += 1
end

puts decrypted_string
File.write('decrypted.txt', decrypted_string)