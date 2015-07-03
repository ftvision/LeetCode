# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
    nums.sort!
    ans = []
    for x in  0...(1 << nums.length)
        tmp = []
        count = 0
        while x > 0
            tmp += [nums[count]] if x ^ (x - 1) === 1
            count += 1
            x = x >> 1
        end
        ans += [tmp]
    end
    return ans
end