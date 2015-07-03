# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return s.length if s.length < 2
    walker, runner, ans = 0, 1, 1
    hash = {}
    hash[s[0]] = 0
    while runner < s.length
        if !hash[s[runner]].nil? 
            stop = hash[s[runner]]
            while walker <= stop
                hash.delete(s[walker])
                walker += 1
            end
        end
        ans = [ans, runner - walker + 1].max
        hash[s[runner]] = runner
        runner += 1
    end
    return ans
end