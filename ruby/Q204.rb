# @param {Integer} n
# @return {Integer}

# O(N^1.5)/O(1) TLE
def is_prime(n)
    return false if n < 2
    t = 2
    while t * t <= n
        return false if n % t === 0
        t += 1
    end
    return true
end;
def count_primes(n)
    ans = 0
    for i in 2..n
        ans+=1 if is_prime(i)
    end;
    return ans
end

# O(N loglogN)? / O(N)  
# use [false] * (n+1) is much faster than hashtable {}
def count_primes(n)
    hash = [false] * (n+1)
    ans = 0
    for i in 2...n
        if !hash[i]
            ans += 1
            if i ** 2 <= n
                tmp = i ** 2
                while tmp <= n 
                    hash[tmp] = true
                    tmp += i
                end
            end
        end
    end;
    return ans
end

#[ThirteenBeans's solution](https://leetcode.com/discuss/39124/a-simple-ruby-solution)
#Beautiful solution
def count_primes(n)
    mark = [false] * (n + 1)
    counter = 0
    for i in 2...n
        next if mark[i] == true
        counter += 1
        (i * i).step n, i do |j| mark[j] = true end
    end
    counter
end