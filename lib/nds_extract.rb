# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  movie_index = 0 
  result = []
  
  while movie_index < movies_collection.size do
    result << movie_with_director_name(name, movies_collection[movie_index])
    movie_index += 1 
  end
result 
end


def gross_per_studio(collection)
  binding.pry
  gross_result = collection.sum {|h| h[:worldwide_gross]}
  #collection.each_with_object(Hash.new(0)) { |g,h| h[g[:studio]] += g[:worldwide_gross]}
end

def movies_with_directors_set(source)
  
  line_items = source.map do |h| 
    result = []
    result << { title: h[:title], director_name: h[:name] } 
    result
  end
 
end  




# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end


 