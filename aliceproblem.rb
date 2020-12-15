# ---------- getting inputs of leaderboard ----------
def gets_leaderboard_values
    puts "\n"
    puts "----------------------leaderboard inputs-------------------\n"
    puts "\n"
    puts "Enter the number of players on the leaderboard e.g 5"
    no_of_players= gets.chomp.to_i
    puts "enter leaderboard values e.g 100 40 39 "
    scores = gets.chomp.split(' ').map(&:to_i)
    if no_of_players != scores.length
        puts "\nErr----The number of players should equal to the scores you put or vice versa\n\n"
        no_of_players=nil
        scores=[]
        gets_leaderboard_values
    else
        return no_of_players , scores 
    end
end

# --------- getting input of alice games ------------
def gets_alice_values 
    puts "\n"
    puts "-----------------------alice inputs------------------------\n"
    puts "\n"
    puts "Enter the number of games that alice played"
    no_of_games= gets.chomp.to_i
    puts "enter alice scores e.g 23 45 64 "
    scores= gets.chomp.split(' ').map(&:to_i)
    if no_of_games != scores.length
        puts "Err-------number of alice games should equal to the scores of the alice games \n\n"
        no_of_games=nil
        scores=[]
        gets_alice_values
    else
        return no_of_games , scores 
    end
end

# ---------- merging all inputs into one function ---------
def gets_inputs
    leaderboard_output = gets_leaderboard_values()

    alice_output = gets_alice_values()
    return leaderboard_output[1] , alice_output[1]
end

# --------- Main functiion for getting ranks----------
def climbingLeaderboard(leaderboard , alice ) 
    leaderboard = (leaderboard.concat(alice)).uniq.sort{| a ,b | b <=> a}
    ranks = []
    alice.each do | a_value|
        ranks << leaderboard.index(a_value) + 1
    end
    return ranks 
end

leaderboar_score , alice_score  = gets_inputs

puts "\n"
puts "----------- Alice ranks -----------"
puts "\n"
p climbingLeaderboard(leaderboar_score , alice_score)
