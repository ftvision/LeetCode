# @param {Integer} n
# @return {String}
def convert_to_title(n)
    s = ""
    while n > 0 
        s = ((n - 1) % 26 + 65).chr + s
        n = (n - 1) / 26
    end
    return s
end