class Solution:
    # @param {integer[]} nums
    # @return {integer}
    def singleNumber(self, nums):
        ans = 0
        for each in nums:
        	ans = ans ^ each;
        return ans
