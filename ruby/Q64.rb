# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
    ans = grid[0]
    for i in 1...grid[0].length
        ans[i] += ans[i-1]
    end
    for i in 1...grid.length
        ans[0] += grid[i][0]
        for j in 1...grid[i].length
            ans[j] = [ans[j], ans[j-1]].min + grid[i][j]
        end
    end
    return ans[grid[0].length - 1]
end