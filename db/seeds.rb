require 'open-uri'
require 'json'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie|

Movie.create!(
  title: movie['title'],
  overview: movie['overview'],
  poster_url: movie['backdrop_path'],
  rating: movie['vote_average']
)
end

puts "created #{Movie.count}"
