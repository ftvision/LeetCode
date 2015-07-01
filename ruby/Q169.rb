# @param {Integer[]} nums
# @return {Integer}

#O(N) time, O(1) space
def majority_element(nums)
    ans = nil;
    rep = 1;
    nums.each do |x|
        rep = x === ans ? rep + 1 : rep - 1;
        ans = x if rep === 0;
        rep = 1 if rep === 0;
    end
    return ans
end

#hash table O(N)
def majority_element(nums)
   hash = {}
   nums.each {|x| hash[x] = hash.include?(x) ? hash[x]+=1 : hash[x] = 1}
   hash.each {|x, value| return x if value > nums.length/2} 
end

#binary search for answer O(NlogC)
def majority_element(nums)
   left = nums.min 
   right = nums.max 
   while left <= right do
   		mid = (left + right) / 2;
   		count = 0;
   		nums.each {|x| count+=1 if x >=mid}
   		if count > nums.length/2 
   			ans = mid
   			left = mid + 1
   		else
   			right = mid - 1
   		end;
   end 
   return ans
end