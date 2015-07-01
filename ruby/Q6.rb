# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
   row_info = [];
   num_rows.times {|x| row_info[x] = ""};
   iter = +1
   row = -1;
   return s if num_rows === 1 #special case
   s.each_char do |c|
		row += iter
		row_info[row] += c
	   	if row === num_rows - 1 #wallking down turn to walking up right
	   		iter = -1
	   	elsif row === 0	#walking up right turn to walking down
	   		iter = +1
	   	end;
 	end
 	ans = ""
 	row_info.each {|tmps| ans += tmps}
 	return ans
end