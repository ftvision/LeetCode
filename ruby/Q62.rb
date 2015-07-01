# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    ans = Array.new(m + 1, Array.new(n + 1,0)) #initialize 2D array
    for x in 1..m 
        for y in 1..n
            ans[x][y] = x === 1 && y === 1 ? 1 : ans[x-1][y] + ans[x][y-1]
        end
    end
    return ans[m][n]
end

#math solution, O(N)/O(1) Time/Space
def gcd(a,b)
	return a if b === 0
	return gcd(b, a % b)
end
def unique_paths(m, n)
	n_base = m + n - 2
	k_select = m - 1
	up, down = 1,1
	for i in 1..(n_base - k_select)
		up *= (i + k_select)
		down *= i
		tmp = gcd(up,down)
		up /= tmp
		down /= tmp
		puts i, up, down
	end;
	return up
end

