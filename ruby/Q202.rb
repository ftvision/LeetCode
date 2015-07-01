# @param {Integer} n
# @return {Boolean}
def is_happy(n)
    hash = {n=>true}
    while hash[1].nil? 
        tmp = 0;
        while n > 0 
            tmp += (n % 10) ** 2
            n = n / 10
        end
        return false if !hash[tmp].nil?
        hash[tmp] = true
        n = tmp
    end
    return true
end

#O(1) space, 2 point 
def proceed(n)
    tmp = 0
    while n > 0
        tmp += (n % 10) ** 2
        n = n / 10
    end
    return tmp
end
def is_happy(n)
    walker, runner = n, n
    while runner != 1
        walker = proceed(walker)
        runner = proceed(proceed(runner))
        return false if walker === runner && walker != 1 
    end
    return true
end