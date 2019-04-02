require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  url = "https://swapi.co/api/people/"

  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  # match = nil

  # response_hash["results"].each { |character|
  #   if character["name"].downcase == character_name
  #     match = character["films"]
  #   end
  # }

  match = response_hash["results"].find do |char|
    char["name"].downcase == character_name
  end

  if match
    match["films"]
  else
    puts "No char found."
    []
  end
end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

# def get_film_titles(get_character_movies_from_api)
# character_movies_array = []
#   get_character_movies_from_api.each {|x|
#     api_string = RestClient.get(x)
#     api_hash = JSON.parse(api_string)
#
#     character_movies_array.push(api_hash["title"])
#   }
# character_movies_array
# end


def print_movies(character_films_array)
  # some iteration magic and puts out the movies in a nice list
    character_films_array.each {|url|
      api_string = RestClient.get(url)
      api_hash = JSON.parse(api_string)
      puts api_hash["title"]
    }
end

def show_character_movies(character_name)
  films = get_character_movies_from_api(character_name)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
