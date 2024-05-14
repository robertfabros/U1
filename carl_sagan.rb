# Robert Fabros
# WEBD-3011
# May 13, 2024


# Using a single puts statement build the following
# sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

puts "\nQuestion #1\n\n"

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

# Using string interpolation to build the sentence
puts "#{carl[:words][2].capitalize} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}#{carl[:punctuation][1]}"

puts "\nQuestion #2\n\n"

ghosts = [
  { name: 'Inky', age: 4, loves: 'reindeers', net_worth: 25 },
  { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: 14 },
  { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: 18.03 },
  { name: 'Clyde', age: 6, loves: 'yarn', net_worth: 0 }
]

ghosts.each do |ghost|
    ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
    ghost_info += "loves #{ghost[:loves]} and "
    ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
    puts ghost_info
end

puts "\nQuestion #3\n\n"

require 'net/http'
require 'json'
require 'pp'  # For pretty print

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.

# Extracting the breeds from the parsed JSON
breeds = dog_breeds['message']

# Using pretty print to print each breed and its sub-breeds
puts "\nFormatted List of Dog Breeds and Sub-breeds:\n\n"
breeds.each do |breed, subs|
  if subs.empty?
    puts "* #{breed.capitalize}"
  else
    puts "* #{breed.capitalize}"
    subs.each do |sub|
      puts "  * #{sub.capitalize}"
    end
  end
end

puts "\nQuestion #4\n\n"

require 'net/http'
require 'json'
require 'pp'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees_data = JSON.parse(response)

# Initialize a counter for Ash trees
ash_tree_count = 0

# Iterate through each tree in the dataset
trees_data.each do |tree|
  # Check if the common name of the tree contains 'ash' (case-insensitive)
  if tree['common_name']&.downcase&.include?('ash')
    ash_tree_count += 1
  end
end

# Print the count of Ash trees using pretty print
puts "Total number of Ash trees in the dataset: #{ash_tree_count}"
