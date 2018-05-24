require 'byebug'

def coin_change(total, coins)
  coin_matrix = Array.new(coins.size+1) { Array.new(total+1) {0}}
  for i in 0..coins.size
    coin_matrix[i][0] = 1
  end

  for i in 1..coins.size
    for j in 1..total
      if coins[i-1] > j
        coin_matrix[i][j] = coin_matrix[i-1][j]
      else
        coin_matrix[i][j] = coin_matrix[i-1][j] + coin_matrix[i][j - coins[i-1]]
      end
    end
  end
  print coin_matrix[coins.size][total]
end

coin_change(5, [1, 2, 3])
