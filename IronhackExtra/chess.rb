# Build a chess board that reads a file of possible moves and lets the user now if their move is legal or not
class Board
   def initialize
       @grid = [
   [:wR, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, nil],
   [nil, nil, nil, nil, nil, nil, nil, :bR]
]    
	end
end

class Piece
   attr_reader :color
   def initialize(color)
       @color = color
   end
end

class Rook < Piece 
   def check_move(board, origin, destination)
       if origin.first == destination.first
           p "LEGAL"
       elsif origin.last == destination.last
           p "LEGAL" 
       else p "ILLEGAL"
       end
   end
end

class Bishop < Piece
	def check_move(board, origin, destination)
    	if (destination[1] == origin[1])
          p "LEGAL"
      elsif ((destination.first-origin.first)/(destination[1]-origin[1])).abs == 1
          p "LEGAL"
      else p "ILLEGAL"
      end
  end
end

class Queen < Piece
	def check_move(board, origin, destination)
		 	if origin.first == destination.first
          p "LEGAL"
      elsif origin.last == destination.last
           p "LEGAL" 
    	elsif (destination[1] == origin[1])
          p "LEGAL"
      elsif ((destination.first-origin.first)/(destination[1]-origin[1])).abs == 1
          p "LEGAL"
      else p "ILLEGAL"
      end
  end
end

class Knight < Piece
		def check_move(board, origin, destination)
				dist1 = (destination[0]-origin[0]) * (destination[0]-origin[0])
				dist2 = (destination[1]- origin[1]) * (destination[1]- origin[1])
				sqrt_dis = dist1 + dist2

			if Math.sqrt(sqrt_dis) == Math.sqrt(5)
				p "LEGAL"
			else
				p "ILLEGAL"
		end
	end
end

class King < Piece
		def check_move(board, origin, destination)
				dist1 = (destination[0]-origin[0]) * (destination[0]-origin[0])
				dist2 = (destination[1]- origin[1]) * (destination[1]- origin[1])
				sqrt_dis = dist1 + dist2

			if Math.sqrt(sqrt_dis) == Math.sqrt(2)
				p "LEGAL"
			else
				p "ILLEGAL"
		end
	end
end

# class Pawn < Piece
# 	def check_move(board, origin, destination)
#        if destination.first == origin.first + 1
#            p "LEGAL"
#        # elsif destination.last == origin.last + 1
#        # 	p "LEGAL"
#        else p "ILLEGAL"
#        end	
#      end
# end


chess_board = Board.new

wR = Rook.new("white")
wR.check_move(chess_board, [0, 0], [1, 0])
wB = Bishop.new("white")
wB.check_move(chess_board, [0, 2], [3, 5])
bQ = Queen.new("white")
bQ.check_move(chess_board, [0, 3], [5, 3])
bK = King.new("black")
bK.check_move(chess_board, [7, 4], [6, 5])
# wP = Pawn.new("white", [7, 4])
# wP.check_move(chess_board, [1,0], [2, 0])
wK = Knight.new("white")
wK.check_move(chess_board, [0, 1], [6, 2])
