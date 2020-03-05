# class Hotel
#     attr_reader :location, :capacity, :num_rooms, :brand, :breakfast, :rating, :reviews
#     @@all = []

#     def initialize(brand, capacity, cost)
#         @cost = cost
#         @capacity = capacity
#         @brand = brand
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def upcoming_rsvp
#         RSVP.all.select {|booking| rsvp.hotel == self}
#     end
# end

#   +----------------------------------------[  C o d e  B e l o w  ]----------------------------------------+

class Hotel < ActiveRecord::Base
  # def room_options
  #   Hotel.where('num_rooms < = ?', user.num_rooms)
  # end
end


# t.string :website
# t.string :phone
# t.string :zip
# t.string :address
# t.integer :num_rooms
# t.string :name





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

# breakfast = boolean.sample
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


#do we need reviews?

