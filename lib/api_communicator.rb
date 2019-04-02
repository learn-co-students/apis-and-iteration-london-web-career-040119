require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  url = "http://swapi.co/api/people/?search=#{character_name}"

  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)

  film = response_hash["results"][0]["films"]
  film_array = []
  film.each do |title|
    film_url = RestClient.get(title)
    film_hash = JSON.parse(film_url)
    film_array << film_hash["title"]
  end
  return film_array

end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each_with_index do |title, i|
  puts "#{i + 1}. #{title}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
