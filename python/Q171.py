class Solution:
    # @param {string} s
    # @return {integer}
    def titleToNumber(self, s):
    	ans = 0
        for c in s:  #you can almost iterate everything in python
        	ans = ans * 26 + (ord(c) - 65 + 1)
        return ans