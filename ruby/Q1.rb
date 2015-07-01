# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#Hash
def two_sum(nums, target)
    hash = {};
    index1 = 0;
    index2 = 0;
    nums.each_with_index do |x, ind|
        if hash.include?(x)
            index1 = hash[x]
            index2 = ind + 1
            break
        else
            hash[(target-x)] = ind + 1
        end
    end
    return [index1, index2]
end

#Sort + Binary
def two_sum(nums, target)
    index1 = 0;
    index2 = 0;
    ans1 = nil;
    ans2 = nil;
    nums2 = nums.sort #Don't know what algorithm has been used in standard library.
    nums2.each do |x|
        left = 0
        right = nums2.length - 1
        #binary search
        while left <= right do
            mid = (left + right) / 2
            mid_value = nums2[mid]
            if mid_value === (target - x)
                ans1 = x
                ans2 = mid_value
                break
            elsif mid_value > (target - x)
                right = mid - 1
            else
                left = mid + 1
            end
        end        
        #exit loop if answers are gotten
        break if !ans1.nil?    
    end
    nums.each_with_index do |x, ind|
        puts [x, ind]
        if x === ans1
            $ind1 = ind + 1 #if first set in the block, the variable is local, or, use $ to indicate it is global variable
            ans1 = nil
        elsif x === ans2
            $ind2 = ind + 1
            ans2 = nil
        end
    end
    index1 = [$ind1, $ind2].min
    index2 = [$ind1, $ind2].max
    return [index1, index2]
end