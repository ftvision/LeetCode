# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
    min, max = 0, x
    while min <= max do
        mid = (min + max) / 2;
        if mid * mid === x 
            return mid
        elsif mid * mid > x
            max = mid - 1
        else
            min = mid + 1
        end;
    end;
    return max
end