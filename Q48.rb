# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
    n = matrix.length
    for i in 0...n/2 do
        startx, starty = i, i
        move_times = n - 1 - i * 2
        while move_times > 0 do
            x, y = startx, starty
            3.times{
                x_next, y_next = n - 1 - y, x
                matrix[x][y], matrix[x_next][y_next] = matrix[x_next][y_next], matrix[x][y]
                x, y = x_next, y_next
            }
            starty += 1
            move_times -= 1
        end
    end
    return nil
end

#use O(n^2) space to transform.
#be careful with ans = matrix, and then modify ans; 
#here, the modification of ans would lead to the moditicaiton of nums,
#because ans and nums are pointing to the same object
def rotate(matrix)
    n = matrix.length
    ans = Array.new(n){Array.new(n,0)}
    for i in 0...n do
        for j in 0...n do
            ans[i][j] = matrix[n-1-j][i]
        end
    end
    for i in 0...n do
        for j in 0...n do
            matrix[i][j] = ans[i][j]
        end
    end
    return nil
end