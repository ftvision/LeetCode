# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    return false if matrix.length === 0
    n, m = matrix.length, matrix[0].length
    #search for row
    l = 0; r = n - 1
    while l <= r
        mid = (l + r)/2
        puts "l = %d, r = %d, mid = %d" % [l,r,mid]
        r = mid - 1 if matrix[mid][0] > target
        l = mid + 1 if matrix[mid][0] < target
        return true if matrix[mid][0] === target
    end
    target_row = r
    #search for column
    l = 0; r = m - 1
    while l <= r
        mid = (l + r)/2
        puts "l = %d, r = %d, mid = %d" % [l,r,mid]
        r = mid - 1 if matrix[target_row][mid] > target
        l = mid + 1 if matrix[target_row][mid] < target
        return true if matrix[target_row][mid] === target
    end
    return false
end