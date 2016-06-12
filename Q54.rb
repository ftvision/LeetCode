# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
   return [] if matrix.length === 0
   n, m = matrix.length, matrix[0].length
   direction = [[0, 1], [1, 0], [0, -1], [-1, 0]]
   x, y = 0, -1
   ans = [];
   while m > 0 || n > 0
        m.times {x += direction[0][0]; y += direction[0][1]; ans += [matrix[x][y]]; } if m > 0 && n > 0# going to the right
        n -= 1;
        n.times {x += direction[1][0]; y += direction[1][1]; ans += [matrix[x][y]];  } if m > 0 && n > 0# going down
        m -= 1;
        m.times {x += direction[2][0]; y += direction[2][1]; ans += [matrix[x][y]];  } if m > 0 && n > 0# going to the right
        n -= 1;
        n.times {x += direction[3][0]; y += direction[3][1]; ans += [matrix[x][y]];  } if m > 0 && n > 0# going down
        m -= 1;
    end
    return ans
end