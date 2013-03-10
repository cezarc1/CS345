class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

# 0 if m2 beats m1, 1 if m1 beats m2
def rps_result(m1, m2)
   relations = Hash["P", "R",  "R", "S",  "S", "P" ] 
   raise NoSuchStrategyError unless (relations.has_key?(m1.upcase) && relations.has_key?(m2.upcase))
   if (m1.eql? m2) then return 1 end
   if relations[m1.upcase].eql?(m2) then return 1 else return 0 end
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	if rps_result(game[0][1],game[1][1]) == 0 then return game[1] else return game[0] end
end

def rps_tournament_winner(game)
  if game[0][1].is_a?(String)
    return rps_game_winner(game)
  end
   return rps_game_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])] )
end