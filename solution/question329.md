---
title: Question 329
category: [Algorithm]
tags: [Memorized DP]
---

![Description](../Assets/Figure/question329.png)

## Algorithm

- 这个就是个Memorized Search / DP
- 可以想象：`F[i,j]`定义为以`i, j`为起点的最长串。
- 因为这个问题满足最优子结构：最长串的substring也是最长的，所以`F[i,j] = 1 + F[i + dx, j + dy] if matrix[i + dx, j + dy] > martix[i, j]`。
- 最后就只要注意一下边界条件了。Python写起来不难。

## Comment

- 如果把函数写在给定的函数里面，通过Closure，内部函数可以自动获得所有外部函数的变量。这就省去了很多问题。

## Code

不用Hash的解，仿照上面的思路写的

```python
class Solution(object):

    def longestIncreasingPath(self, matrix):

        def search(i, j):
            if ans[i][j] is not None:
                return ans[i][j]
            max_len = 0
            for dx, dy in [(-1, 0), (0, 1), (0, -1), (1, 0)]:
                if i + dx < n and i + dx >= 0 and j + dy < m and j + dy >= 0 and matrix[i][j] > matrix[i + dx][j + dy]:
                    max_len = max(max_len, search(i + dx, j + dy))
            ans[i][j] = max_len + 1
            return ans[i][j]

        if len(matrix) == 0:
            return 0
        n, m = len(matrix), len(matrix[0])
        ans = [[None] * m for _ in range(n)]
        return max(search(i,j) for i in range(n) for j in range(m))

```

[StefanPochmann](https://discuss.leetcode.com/topic/34803/short-python/2)这个解也是厉害

```python
def longestIncreasingPath(self, matrix):
    def length(z):
        if z not in memo:
            memo[z] = 1 + max([length(Z)
                               for Z in z+1, z-1, z+1j, z-1j
                               if Z in matrix and matrix[z] > matrix[Z]]
                              or [0])
        return memo[z]
    memo = {}
    matrix = {i + j*1j: val
              for i, row in enumerate(matrix)
              for j, val in enumerate(row)}
    return max(map(length, matrix) or [0])
```
