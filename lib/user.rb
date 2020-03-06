
# class User
#     attr_accessor :name, :budget, :num_people, :dates
#     @@all = []

#     def initialize(name, budget, num_people)
#         @dates = dates
#         @name = name
#         @budget = budget
#         @num_people = num_people
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def available_hotels
#         hotels.all.select do
#             |hotel| hotel.capacity =< self.num_people,
#             hotel.cost =< self.budget
#         end
#     end

#     def booked_hotels
#         RSVP.all.select {|booking| booking.user == self}
#     end

#     def add_hotel(budget, num_people, hotel)
#         if available_hotels.include?(hotel)
#             RSVP.new(self, budget, num_people, hotel)
#             puts "Thank you for booking with #{hotel}! We look forward to your visit!"
#         else
#             raise "Please select a valid hotel from the available hotels list."
#     end
# end

#   +----------------------------------------[  C o d e  B e l o w  ]----------------------------------------+

# def table(name, start_date, budget, peeps)
#     sql = <<-SQL
#     CREATE TABLE IF NOT EXISTS users (
#         id INTEGER PRIMARY KEY, 
#         name TEXT, 
#         start_date DATETIME, 
#         budget INTEGER, 
#         peeps INTEGER
#         )
#         SQL
# end

class User < ActiveRecord::Base
    def book_hotel(num)
        RSVP.create({user_id: self.id, hotel_id: num, start_date: self.start_date, departure_date: self.departure_date, budget: self.budget, num_rooms: self.num_rooms})
    end
    
    def view_bookings(hotel_name=nil)
        # hotel = Hotel.where("id = ?", RSVP.hotel_id)
        array = [] 
        array << RSVP.where("rsvps.user_id = ?", self.id)
        for i in array 
            i.each do |booking|
                puts " "
                puts "|-----------------------0---------------------------|"
                puts "|                                                   |"       
                puts "| Booking ID: #{booking.id}"
                puts "| Housing Type: #{hotel_name}*"
                puts "| Number of Rooms: #{booking.num_rooms}"
                     #"| Cost: #{hotel.budget}                       "
                puts "| *  TO VIEW HOTEL NAME, BUY PREMIUM SUBSCRIPTION**"
                puts "| ** Please refer to the last step of application"     
                puts "|                                                   |"
                puts "|-----------------------0---------------------------|"
            end
        end
   end

    def view_options
        array = []
        array << Hotel.where("num_rooms >= ? AND budget <= ?", self.num_rooms, self.budget)
        puts "Thine options are: "
        for i in array
            i.each do |hotel|
                puts " "
                puts "|-------------------0---------------------|"
                puts "|                                         |"
                puts "| Hotel ID: #{hotel.id}"
                puts "| Hotel Name: #{hotel.name}" 
                puts "| Available Rooms: #{hotel.num_rooms}"
                puts "| Price: #{hotel.budget}"
                puts "| Has gym? #{hotel.gym} "
                puts "| Has pool? #{hotel.pool}"
                puts "| Free breakfast? #{hotel.breakfast} "
                puts "|                                         |"
                puts "|-------------------0---------------------|"

            end
        end
    end

    def delete_booking(num)
        RSVP.delete(num)
    end
end

# t.string :name
# t.datetime :start_date
# t.datetime :departure_date
# t.integer :budget
# t.integer :num_rooms
# t.boolean :breakfast
# t.boolean :pool
# t.boolean :gym