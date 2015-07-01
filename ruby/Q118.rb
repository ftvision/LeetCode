# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
    ans = []
    tmp = [1]
    num_rows.times {|x|
        ans = ans + [tmp]
        tmp += [1]
        x.downto(1) {|y|
            tmp[y] += tmp[y-1]
        }
    }
    return ans
end