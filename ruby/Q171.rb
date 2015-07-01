# @param {String} s
# @return {Integer}
def title_to_number(s)
	ans = 0;
   	s.each_char {|c| ans = ans * 26 + (c.ord - 65 + 1)} #each_char
   	return ans 
end