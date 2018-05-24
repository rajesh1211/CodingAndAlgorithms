require 'byebug'
class Pattern
  def pat1_print
    n = 4
    num = 0
    i = 0
    while (i < 2*n-1) do
      j = 0;
      while(j < (n - 1 - i).abs) do
        print " "
        j += 1
      end
      j = 0;
      while(j < 2*(n -(n-1-i).abs) - 1) do
        print num = num + 1
        j += 1
      end
      i += 1
      puts
    end
  end

  def pat2_print
    n = 4
    i = 0
    while (i < 2*n - 1 ) do
      j = 0
      while (j < 2*n - 1 ) do
        print (1 + ( [(n-i-1).abs,(n-j-1).abs].max ) )
        j +=1
      end
      i += 1
      puts
    end
  end


  def even_list
    arr = [1, 2, 3 ,4, 5, 6]
    n = arr.length/2
    i = 0
    new_arr = []
    while(i <= n-1) do
      new_arr << arr[i] + arr[arr.length-1-i]
      i += 1
    end

    puts new_arr.join(" ")

  end

  def dict
    d = [ "Rat", "mat", "bat", "chat",
          "cat", "tab", "fab", "batt"]

    chars = ['t', 'a', 'b', 'c']

    combinations = []
    for i in (1..chars.length) do
      combinations << chars.permutation(3).map{ |ar| ar.join("")}
    end

    p combinations.flatten & d
  end
end
# Pattern.new.pat2_print
# Pattern.new.even_list
Pattern.new.dict
