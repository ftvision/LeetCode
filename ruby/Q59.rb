# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
    direction = [[0,1],[1,0],[0,-1],[-1, 0]]
    map = Array.new(n){ Array.new(n, 0)} #initialize 2D Array is a pain. Array.new( Array.new) will have problem because change one element will change all of them. 
    count, go, x, y = 1, 0, 0, 0
    while count <= n * n 
        map[x][y] = count
        count += 1
        tmpx = x + direction[go][0]
        tmpy = y + direction[go][1]
        if tmpx >= n or tmpx < 0 or tmpy >= n or tmpy < 0 or map[tmpx][tmpy] != 0
            go = (go + 1) % 4
        end
        x += direction[go][0]
        y += direction[go][1]
    end
    return map
end