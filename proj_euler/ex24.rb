require "pry"
def lex_perm(fin, nth)
	perm = (0..fin).to_a
	count = 1
	until count == nth do 
		#byebug
		n = perm.length - 1
		i = n - 1
		until perm[i] < perm[i + 1] do 
			i -= 1		
		end
		j = n
		until perm[j] > perm[i] do 
			j -= 1		
		end
		perm[i], perm[j] = perm[j], perm[i]
		perm = perm[0..i] + perm[i + 1..n].reverse
		count += 1
	end
	perm
end

# puts lex_perm