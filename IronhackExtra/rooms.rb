#Create a game with at least 5 spaces. They don’t necessarily have to be rooms. Each space can have more than one exit/entry, for example an exit to the East and an exit to the West.
#Write descriptions of each of the spaces and error messages for when the user tries to go in a direction where there is no exit, or when they enter a command that is not recognized.
#The user should have four directional commands: N, E, S, W.
#Write some global action commands that the user can enter in any space, like “look for food” and write what the consequences are in the game (the same action could have different consequences in different spaces).

#The character starts in a room.
#The description of the room is printed. The description should give the user a hint about what to do next.
#A > symbol is shown to prompt the user for input.
#There are 4 options for movement input: N for north, S for south, E for east and W for west.
#If the character is able to move in the direction (s)he chose, a description of the new room is printed and the prompt is shown again for inputting additional movement commands or special room-specific commands.
#If the character is not able to move in the direction (s)he chose, a game-appropriate error message must be shown and the description of the current room along with the prompt must be repeated.
#A room's special commands can trigger any behaviour desired. For example, if there are objects in the room the user could pick up the objects and use them. If the room has another person in it the user could interact with the person. User your imagination!

# require 'pry'

class Room
    attr_accessor :description, :exit
    def initialize(description, exit)
        @description = description
        @exit = exit
    end
end

class GameOfRooms
    def start_game(room)
        puts
        puts "-----------Instructions----------------"
        puts
        puts room.description
        puts
        puts "Type either N, S, E, or W to choose a direction to move."
        puts ">"
        user_choice = gets.chomp
        check_exit(room, user_choice)
    end
    def check_exit(room, choice)
        if choice == room.exit
            puts "Well done! You have survived this room."
            puts
        else
            puts "Like most of George R.R. Martin's characters, you die a horrible, bloody death."
            puts
        end
    end
end

room_one    =   Room.new("You are are the Wall. There are Wildlings attacking from below and they are about to breach the top.", "N")
room_two    =   Room.new("You are in the Red Keep and the King has summoned his Guard to arrest you. You have two exit doors in your room.", "E")
room_three  =   Room.new("You are in the Dothraki Sea and the Khalasar is heading your way. They have found you wandering unannounced into their territory.", "S")
room_four   =   Room.new("You are in Dorne. The Sand Vipers think you were invloved in Oberyn's death. Behind you is the desert and in front of you is escape via the sea.", "W")
room_five   =   Room.new("You are at the Aerie. The only way out is either down through the Moon Door, or down the passageway to your side.", "N")

GameOfRooms.new.start_game(room_one)
GameOfRooms.new.start_game(room_two)
GameOfRooms.new.start_game(room_three)
GameOfRooms.new.start_game(room_four)
GameOfRooms.new.start_game(room_five)








