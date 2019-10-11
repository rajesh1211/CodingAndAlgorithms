# https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem 
class ClimbingTheLeaderBoard
  attr_accessor :scores_map

  def initialize(scores, your_score)
    @scores_map = []
    @scores = scores.uniq
    @your_score = your_score

    setup_leader_board
  end  

  def result
    final_ranks = []
    index = @scores_map.size-1
    @your_score.each do |sc|
      if sc < @scores_map.last[:score]
        final_ranks << @scores_map.last[:rank] + 1
        next
      end

      if sc >= @scores_map.first[:score]
        final_ranks << 1
        next
      end

      foundindex = @scores_map[0..index].bsearch_index do |ld|
        sc >= ld[:score]
      end

      final_ranks << @scores_map[foundindex][:rank]
      index = foundindex
    end
    final_ranks
  end

  def setup_leader_board
    rank = 1
    @scores.each_with_index do |s, index|
      if index == 0
        assign_rank(index, s, rank)
        next
      end

      if scores_map[index-1][:score] == s
        assign_rank(index, s, scores_map[index-1][:rank])
      else
        rank = rank + 1
        assign_rank(index, s, rank)
      end
    end
  end

  def assign_rank(index, score, rank)
    @scores_map[index] = {}
    @scores_map[index][:score] = score
    @scores_map[index][:rank] = rank
  end
end