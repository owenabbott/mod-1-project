p "RUNNING SEED FILE"
require 'dbf'
Hotel.destroy_all
# puts User.all
# Hotel.delete_all
# Delete all Users in DataBase, useful if we're going to run this file a lot.
 #Hotel.destroy_all


# ASSUMING THE HOTELS FILE IS ALSO IN THIS DB FOLDER
filepath = File.join(File.dirname(__FILE__), 'Hotels.dbf')
hotels = DBF::Table.new(filepath)
# Use docs at the repo address for each loop syntax

#binding.pry

array_of_hotels = []

hotels.each do |hotel|
  array_of_hotels.push(hotel)
  # Hotel.create({phone: hotel_phone, website: nil, zip: nil, address: hotel_address, num_rooms: nil, name: hotel_name})
end



def hotell(array)
  truefalse = [true, false]
  sample = array.sample
  Hotel.create({website: sample.web_url, phone: sample.phone, zip: sample.zip, address: sample.address, num_rooms: sample.numrooms, name: sample.name, breakfast: truefalse.sample, gym: truefalse.sample, pool: truefalse.sample, budget: rand(100)})
end

30.times do hotell(array_of_hotels)
end



# Hotel.create({website: hotel.web_url, phone: hotel.phone, zip: hotel.zip.to_i, address: hotel.address, num_rooms: nil, name: hotel.name})
# puts Hotel.all









Hotel.create({website: 'www.google.com', phone: '123-456-7890', zip: '12345', address: '123 fake street', num_rooms: '10', name: 'The Overlook', budget: 0, gym: false, pool: false, breakfast: false})
Hotel.create({website: 'www.rottentomatoes.com', phone: '456-234-8903', zip: '12345', num_rooms: '1000', name: 'Another Hotel'})
Hotel.create({website: 'www.downloadviruses.com', phone: '345-234-8593', zip: '45352', num_rooms: '99999999999999999999999999', name: 'The House of Leaves', budget: 0})
Hotel.create({website: 'www.websites.com', phone: '234-567-4869', zip: '2230', num_rooms: '200', name: 'Bad Hotel'})
Hotel.create({website: 'www.hotels.com', phone: '849-234-8475', zip: '43287', num_rooms: '10', name: 'Good Hotel'})

  





binding.pry






#what we have to play around with in this database:
# web_url
# phone
# zip
# gis_id (sounds like a foreign key for mapping with some other table)
# address
# numrooms
# name
# latitude/longitude
# addrid (another foreign key)


#okay'd generating random data to supplement this table with duke so we can create a more complex program


# boolean = [true, false]
# pool = pool.sample


#hotel cost = rand(900)

# breakfast = boolean.sample

#breakfast = boolean.sample
  #if true
  #breakfast_good? = boolean.sample
  #else breakfast_good = false

# gym = boolean.sample 

# def bedbugs 
  #has_bugs = boolean.sample
      #if true value = rand(100000000000000)
      #if false value = 0 
      #puts this hotel has an average of #{value} bedbugs in each room.


#rating = a float between 1 and 5. Obvs this is going to utilize .rand but I'm really bad at that.


#reviews?



