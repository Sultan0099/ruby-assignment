# getting inputs of leaderboard
def gets_leaderboard_values
    puts "Enter the number of players on the leaderboard e.g 5"
    no_of_players= gets.chomp.to_i
    puts "enter leaderboard values e.g 100 40 39 "
    scores = gets.chomp.split(' ').map(&:to_i)
    if no_of_players != scores.length
        puts "The number of players should equal to the scores you put or vice versa\n\n"
        gets_leaderboard_values
    end
    return no_of_players , scores 
end

# getting input of alice games
def gets_alice_values 
    puts "Enter the number of games that alice played"
    no_of_players= gets.chomp.to_i
    puts "enter alice scores e.g 23 45 64 "
    scores= gets.chomp.split(' ').map(&:to_i)
    if no_of_players != scores.length
        puts "number of alice games should equal to the scores of the alice games \n\n"
        gets_alice_values
    end
    return no_of_players , scores 
end

# merging all inputs into one function
def gets_inputs
    leaderboard_output = gets_leaderboard_values()
    alice_output = gets_alice_values()
    return leaderboard_output[1] , alice_output[1]
end

# Main functiion for getting ranks
def climbingLeaderboard(leaderboard , alice ) 
    leaderboard = leaderboard | alice 
    ranks = []
    alice.each do | a_value|
        ranks << leaderboard.index(a_value) + 1
    end

    p leaderboard
    return ranks 
end

leaderboar_score , alice_score  = gets_inputs

p climbingLeaderboard(leaderboar_score , alice_score)
