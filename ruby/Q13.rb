# @param {String} s
# @return {Integer}
def roman_to_int(s)
    last = nil
    ans = 0;
    order = {"I"=>1, "V" =>5, "X" =>10, "L" => 50, "C" =>100, "D" =>500, "M" =>1000}
    s.each_char do |c| 
        ans += order[c]
        ans -= order[last] * 2 if !last.nil? && order[last] < order[c]
        last = c
    end;
    return ans
end