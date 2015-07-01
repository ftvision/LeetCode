# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

#two pass
def sort_colors(nums)
    ans = [0,0,0]
    nums.each {|x| ans[x] += 1}
    for i in 0...nums.length 
        if ans[0] > 0 
            nums[i] = 0
            ans[0] -= 1
        elsif ans[1] > 0
            nums[i] = 1
            ans[1] -= 1
        else
            nums[i] = 2
            ans[2] -= 1
        end
    end
    return nil
end

#one pass solution
