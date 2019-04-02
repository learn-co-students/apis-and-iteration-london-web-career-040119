require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  to_return = []
  i = 0
  while i < response_hash['results'].length
    if response_hash["results"][i]['name']== character_name
      to_return.push(response_hash['results'][i]['films'])
      break
      #puts response_hash['results'][i]['films']
    end
    i = i+1
  end
  films_urls = to_return.flatten
  #puts films_urls
  values_to_return = []
  j=0
  while j < films_urls.length
    film_string = RestClient.get(films_urls[j])
    film_hash = JSON.parse(film_string)
    values_to_return.push(film_hash)
    j = j+1
  end
return values_to_return
end

def print_movies(films)
  i = 0
  while i < films.length
    each_hash = films[i]
    #puts each_hash
    #break
    each_hash.select{|key,data| key=="title"}
    i = i+1
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def welcome
  puts "Welcome!"
end

def get_user_character
  puts "Enter the name of a Star Wars character to view their film stats."
  gets.chomp
end
