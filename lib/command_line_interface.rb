def welcome
  # puts out a welcome message here!
  'Welcome to the Star Wars Fan Database'
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  character_name = gets.chomp.downcase
end
