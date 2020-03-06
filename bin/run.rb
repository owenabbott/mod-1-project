require_relative '../config/environment'
require 'pry'


def option_menu(tourist)
puts "For additional options, type 'options' Otherwise, type 'exit'."
    response = gets.chomp 
        if response == 'options'
            puts "select your choice from the list below"
            puts "1. Delete booking"
            puts "2. Book another"
            puts "3. Update preferences."
            puts "4. Exit."
            response = gets.chomp
        elsif response == 'exit'
            puts "Fine then."
            return "Thank you"
        else 
            puts "Invalid response"
            option_menu(tourist)
        end
        if response == "1"
            puts tourist.view_bookings
            puts "Select the ID of the booking you would like to delete."
            id = gets.chomp
            tourist.delete_booking(id)
        elsif response == "2"
            tourist.view_options 
            puts "Please select the identification number of the hotel you would like to book"
            selection = gets.chomp
            selection.to_i 
            tourist.book_hotel(selection)
        elsif response == "3"
            puts "What would you like to update?"
            puts "1. Budget"
            puts "2. Number of rooms required."
            puts "3. Start date."
            puts "4. End date."
            selection = gets.chomp
                if selection == "3" 
                    puts "Enter new start date for your trip (yyyy-mm-dd)."
                    value = gets.chomp 
                    tourist.update(start_date: value)                    
                    puts "Your new start date is #{value}. Select options and then book another trip to create a new RSVP!"
                    option_menu(tourist)
                elsif selection == "4"
                    puts "Enter new end date for your trip (yyyy-mm-dd)"
                    value = gets.chomp 
                    tourist.update(departure_date: value) 
                    puts "Your new departure date is #{value}. Select options and then book another trip to create a new RSVP!"
                    option_menu(tourist)
                elsif selection == "1"
                    puts "Enter your new budget in a dollar amount in the form of an integer."
                    value = gets.chomp
                    tourist.update(budget: value) 
                    puts "Your new budget is #{value}. Select options and then book another trip to create a new RSVP!"
                    option_menu(tourist)
                elsif selection == "2"
                    puts "Enter the new number of rooms required in the form of an integer."
                    value = gets.chomp 
                    tourist.update(num_rooms: value)
                    puts "The new number of rooms you will be booking is #{value}. Select options and then book another trip to create a new RSVP!"
                    option_menu(tourist)
                else put "Invalid response"
                    option_menu(tourist)
                end
        elsif response == "4"
            thanks = "Fine then."
            puts thanks
            return thanks
        end
        option_menu(tourist)
end





def checkdate(string)
    if string.length == 10 && string[4] == '-' && string[7] == '-'
        start_check = string.split('-')
        start_check = start_check.join("")
            if start_check.to_i > 0
                puts "Your trip begins on #{string}"
            else puts "Invalid"
        end
    else puts "Invalid"
    end
    answer = string.to_time
    # string = string.split('-')
    # puts string
    # answer = DateTime.new(string[0], string[1], string[2])
    return answer
  end


User.destroy_all
RSVP.destroy_all

puts " "
puts " "
puts " "
puts ""
puts "WELCOME TO RESORT FINDER! Your last resort."


# name = nil
# start_date = nil
# departure_date = nil
# budget = nil
# departure_date = nil
# num_rooms = nil

# User.create({name: name, budget: budget, start_date: start_date, departure_date: departure_date, num_rooms: num_rooms})
# def list_users
#     puts "Are you a returning user?"
#     response = gets.chomp
#         if response == "yes" || response == "y"
#     puts User.all
#     end
# end

def enter_name
    puts "Please enter your name: "

    name = gets.chomp
    name = name.gsub(/[()-,."']/, '')

    puts "Greetings, #{name}."
#gsub bugs out when we use a colon here, need to figure out how to fix that.
end

def enter_starting_date
    puts "Please enter the starting date for your trip (yyyy-mm-dd)"
    start_date = gets.chomp
    checkdate(start_date)
    #links to RSVP table
end

def enter_departure_date
    puts "Please enter the departure date for your trip (yyyy-mm-dd)"
    departure_date = gets.chomp 
    checkdate(departure_date)
end

def define_budget
    puts "Please enter your budget formatted as a dollar amount (integer)"
#we must decide here if we are formatting with a total or symbol. Are we using a float, int, or $$$?
    budget = gets.chomp
    budget = budget.to_i
    if budget > 0
        puts "This is the budget you entered $#{budget}"
        budget
    else
        puts "invalid"
        define_budget
    end
end

def enter_rooms
    puts "Please enter the number of rooms you will be booking as an integer"
    num_rooms = gets.chomp
    num_rooms = num_rooms.to_i
        if num_rooms > 0
            puts "This is the number of people #{num_rooms}"
            num_rooms
        else 
            puts "Invalid!"
            enter_rooms
    end
end



    # Hotel.where("num_rooms >= ?", num_rooms)

    
    name = enter_name
    start_date = enter_starting_date 
    departure_date = enter_departure_date
    budget = define_budget
    num_rooms = enter_rooms

    user = User.create({name: name, budget: budget, start_date: start_date, departure_date: departure_date, num_rooms: num_rooms})

    user.view_options

    puts "Please select the identification number of the hotel you would like to book"
    selection = gets.chomp
    selection.to_i 
    hotel = Hotel.where("id = ?", selection)
    hotel_name = hotel.name
    #binding.pry
    user.book_hotel(selection)


    puts "Thank you. Your booking is complete."
    user.view_bookings(hotel_name)

    option_menu(user)


    puts "Thank you! Your bookings are:"
    puts user.view_bookings(hotel_name)
     
    puts "Please enter your credit card number and expiration date and crv and social security number and address and mother's maiden name."
    personal_info = gets.chomp

    # puts "Thank you. Here is the list of hotels available to you."

    # puts 

    #user.book_hotel


    # puts Hotel.room_options 


    binding.pry
    #need to review video and update here instead of create.

