def climbingLeaderboard(leaderboard_scores , alice_scores )
    alice_ranks = []
    alice_ranks_map = {}
    leaderboard_scores.sort!{|a ,b | b <=> a }.uniq!

    alice_scores.sort!{ |a ,b | b <=> a }

    alice_scores.each_with_index do |alice_score , i|
        leaderboard_scores.each_with_index do | leaderboard_score , j |

            if alice_scores[i] == leaderboard_scores[j] 
                alice_ranks[i] = j+1
                alice_ranks_map[alice_scores[i]] = j+1
                break 

            elsif alice_scores[i] < leaderboard_scores[j] 
                alice_ranks[i] = j+2
                alice_ranks_map[alice_scores[i]] = j+2
                if !leaderboard_scores.include?(alice_scores[i])
                    leaderboard_scores << alice_scores[i]
                end

            elsif alice_scores[i] > leaderboard_scores[j]
                if !leaderboard_scores.include?(alice_scores[i])
                    leaderboard_scores.unshift(alice_scores[i])
                end
                alice_ranks << j+1
                alice_ranks_map[alice_scores[i]] = j+1
                break
            end
        end
    end

    output = { 
        leaderboard_scores: leaderboard_scores ,
        alice_scores: alice_scores,
        alice_ranks: alice_ranks,
        alice_ranks_map: alice_ranks_map
    }   

    return output 
end

leaderboard_scores = [100, 90, 90 , 80 ,60]
alice_scores = [50, 70 , 80 , 100 ]

# the output is in the form of hash
p climbingLeaderboard(leaderboard_scores , alice_scores)