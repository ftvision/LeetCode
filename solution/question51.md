---
title: Question 51
category: [Algorithm]
tags: [DFS]
---

![Description](../Assets/Figure/question51.png)

## Algorithm 

- 八皇后，经典题目。既然要打出所有解，那N一定不大。
- 一般的解法就是直接DFS。
- 当然，加速的方法就是位运算来判断是否能够放置皇后。
- 当然，更加加速的方法其实是在放置皇后的时候都不用for循环。

## Comment

- 用位运算是没错啦，但是竟然位运算写的时候写错了，没有写好。

## Code

```C++
class Solution {
public:
    vector<vector<string>> solveNQueens(int n) {
        string line(n, '.');
        vector<string> map(n, line);
        vector<vector<string>> ans;
        findQueen(ans, map, n, 0, 0, 0, 0);
        return ans;
    }
private:
    void findQueen(vector<vector<string>>& ans, vector<string>& map, int n, int row, int col, int ldiag, int rdiag){
        if (row == n){
            ans.push_back(map);
            return;
        }
        for (int i = 0; i < n; i++){
            if ( !(col & (1 << i)) && !(ldiag & (1 << (row - i + n))) && !(rdiag & (1 << (row + i))) ) {
                col ^= 1 << i; ldiag ^= 1 << (row - i + n); rdiag ^= 1 << (row + i);
                map[row][i] = 'Q';
                findQueen(ans, map, n, row + 1, col, ldiag, rdiag);
                map[row][i] = '.';
                col ^= 1 << i; ldiag ^= 1 << (row - i + n); rdiag ^= 1 << (row + i);
            }
        }
    }
};
```
