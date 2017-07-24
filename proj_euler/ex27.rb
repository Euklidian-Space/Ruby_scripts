require "prime"

def quad_primes
  as = -1000.upto(1000).to_a  
  bs = Prime.each(1000).inject([]) { |arr, n| arr + [n, -n] }.sort
  
  nmax, amax, bmax = 0, 0, 0
  
  for a in as
    for b in bs
      n = 0
      loop do
        break unless Prime.prime? poly(n, a + (b.even? ? -1 : 0), b)
        n += 1
      end
      if n > nmax
        nmax = n
        amax = a
        bmax = b
      end
    end
  end
  amax * bmax
end

def poly(n, a, b)
  (n**2) + n*a + b     
end