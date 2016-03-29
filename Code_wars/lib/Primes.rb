class Primes
  
  def first(n)
   num = int_enum
   primes = []
   loop do
    p = num.next
    if prime?(p)
      primes << p 
      n -= 1
    end
    return primes if n == 0 
   end
  end
  
  def prime?(n)
    return true if n == 2 || n == 3
    return false if n % 2 == 0
    return false if n % 3 == 0
    i = 5
    w = 2
    while i * i <= n
      return false if n % i == 0
      i += w
      w = 6 - w
    end
    return true
  end
  
  private
    
    def sieve_of_eratosthenes(n)
      listA = (2..n).to_a
      p = 2
      loop do
        listA -= get_multiples_of(p).take(n)
        if listA[listA.index(p) + 1]  
          p = listA[listA.index(p) + 1]
        else
          return listA
        end
      end
    end
    
    def get_multiples_of(n)
      Enumerator.new do |enum|
        i = 2
        while true 
          enum.yield n*i
          i += 1
        end
      end
    end
    
    def int_enum
      Enumerator.new do |enum|
        i = 2
        while true
          enum.yield i
          i += 1
        end
      end
    end

end