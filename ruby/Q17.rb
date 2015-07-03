# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    hash = {
        "1"=>"",
        "2"=>"abc",
        "3"=>"def",
        "4"=>"ghi",
        "5"=>"jkl",
        "6"=>"mno",
        "7"=>"pqrs",
        "8"=>"tuv",
        "9"=>"wxyz",
        "0"=>" "
    }
    return [] if digits.length === 0
    ans = [""]
    digits.each_char {|a|
        tmp = []
        ans.each {|x|
            hash[a].each_char{|c|
                tmp+= [x + c]
            }
        }
        ans = tmp
    }
    return ans
end