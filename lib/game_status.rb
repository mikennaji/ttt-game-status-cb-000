# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def full?(board)
  board.all? { |x| x=="O" || x == "X"  }


end

def draw?(board)
  set = won?(board)
  if set.nil?
    return true
  end

  full?(board)
  set = won?(board)
  if set== WIN_COMBINATIONS[0]
    return false
  end




end

def won?(board)


  WIN_COMBINATIONS.each do |win_combination|

    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1= board[win_index_1]
    position_2=board[win_index_2]
    position_3= board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end


  end

  if board.empty?
    return false
  end




end

def over?(board)
  set = won?(board)
  if set.nil? && full?(board)
    return true
  end
  draw?(board)
  won?(board)



end

def winner(board)

  set = won?(board)
  if set.nil?
    return nil
  end
  win_set =board[set[0]]
  if win_set == "O"
    return "O"
  end
  if win_set == "X"
    return "X"
  else
    return nil
  end



end
