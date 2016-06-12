# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    $ans = []
    def dfs(nums, bool, tmp)
        count = 0
        bool.each_with_index do |flag, ind|
            if flag === false
                bool[ind] = true
                dfs(nums, bool, tmp+[nums[ind]])
                bool[ind] = false
                count += 1
            end
        end
        $ans += [tmp] if count === 0
    end
    bool = Array.new(nums.length, false)
    dfs(nums, bool, [])
    return $ans
end
