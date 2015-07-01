# @param {Integer[]} nums
# @return {Integer}

def single_number(nums)
# Xor solution
    ans = nil
    nums.each {|x| ans = ans.nil? ? x : ans ^ x }
    return ans
end

def single_number(nums)
# bit-parse solution
    ans = 0
    sum = 1
    base = 0
    pos = [];
    neg = [];
    ans_pos = 0;
    ans_neg = 0;
    #get all positive number
    nums.each {|x| pos << x if x > 0}
    #get all negative number
    nums.each {|x| neg << -x if x < 0}
    until sum === 0
    	sum = 0
    	pos.each {|x| sum += (x >> base);}
    	ans_pos += sum % 2 << base
    	base += 1
    end
    sum = 1
    base = 0
    until sum === 0
    	sum = 0
    	neg.each {|x| sum += (x >> base);}
    	ans_neg += sum % 2 << base
    	base += 1
    end
    ans = ans_pos > 0 ? ans_pos : -ans_neg
    return ans
end

