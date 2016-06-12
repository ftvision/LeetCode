# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
#O(m+n) in space
def set_zeroes(matrix)
    bool1, bool2 = Array.new(matrix.length, false), Array.new(matrix[0].length, false)
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            if matrix[i][j] === 0
                bool1[i] = true
                bool2[j] = true
            end
        end
    end
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            if bool1[i] || bool2[j]
                matrix[i][j] = 0
            end
        end
    end
    return nil
end

#O(1) in space
def set_zeroes(matrix)
    place_holder = -(1 << 32)
    #fill rows
    for i in 0...matrix.length
        count = 0
        matrix[i].each {|x| count += 1 if x === 0}
        if count > 0
            for j in 0...matrix[i].length
                if matrix[i][j] === 0
                    matrix[i][j] = place_holder
                else 
                    matrix[i][j] = 0
                end
            end
        end
    end
    #fill columns
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            if matrix[i][j] === place_holder
                for k in 0...matrix.length
                    matrix[k][j] = 0
                end
            end
        end
    end
    return nil
end
