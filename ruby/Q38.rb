# @param {Integer} n
# @return {String}
def count_and_say(n)
    ans = "1"
    while n > 1
        tmp = ""
        last = ""
        count = 0
        ans.each_char{|x|
            if last != x
                tmp += count.to_s + last if count != 0
                last = x
                count = 1
            else 
                count += 1
            end
        }
        tmp += count.to_s + last if count != 0
        ans = tmp
        n -= 1
    end
    return ans
end