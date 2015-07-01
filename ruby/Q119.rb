# @param {Integer} row_index
# @return {Integer[]}

#one line version O(k) space
def get_row(row_index)
    ans = [1]
    row_index.times {|x| (x).downto(1) {|y| ans[y] = ans[y] + ans[y - 1]}; ans[x + 1] = 1} #.downto / .upto is amazing
    return ans
end

#full version, O(k) space
def get_row(row_index)
    ans = [1]
    for iter in 1..row_index
    	ans[iter] = 0;
    	scan = iter
    	while scan > 0
    		ans[scan] = ans[scan - 1] + ans[scan]
    		scan -= 1
    	end;
    end;
    return ans
end