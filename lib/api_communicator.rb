require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  to_return = []
  i =0 
  

while i < response_hash['results'].length
  if response_hash["results"][i]['name']== character_name
    to_return.push(response_hash)['results'][i]['films'])
    puts response_hash['results'][i]['films']
    break
  end
  i+=1
end
    films_urls = to_return.flatten
    values_to_return = []
    j=0
    while j<film_urls.length
      film_string = RestClient.get(film_urls[j])
      film_hash = JSON.parse(film_string)
      j +=1 
    
end
values_to_return
end
end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  i = 0
  while i < films.length
    each_hash = films[i]
    each_hash.each do |key,data|
      if key=="title"
        puts "Title : #{data}"
      end
      if key=="director"
        puts "Director : #{data}"
      end
      if key=="producer"
        puts "Producer : #{data}"
      end
      if key == "release_date"
        puts "Release date : #{data}"
      end
    end
    puts "*"*20
    i +=1 
  end
end

  

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
