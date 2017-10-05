---
title: Question 547
category: [Algorithm]
tags: [Union Find]
---

![Description](../Assets/Figure/questio547.png)

## Algorithm

- 这个题目非常直接，就是union find，把不同的individual放到同一个集合里面就好了
- 当然也可以用深搜
- 但是写法上面需要注意

## Comment

- Union-Find写起来还是要注意，尤其是最后统计有多少个union的时候，要重新找一遍所有的individual union。

## Code

```python
class Solution(object):
    def findCircleNum(self, M):
        """
        :type M: List[List[int]]
        :rtype: int
        """
        def union_find(i):
            return i if union[i] == i else union_find(union[i])
        n = len(M)
        union = [i for i in range(n)]
        for i in range(n):
            for j in range (i+1, n):
                if M[i][j]:
                    union[union_find(j)] = union[union_find(i)]
        return len(set(union_find(x) for x in union))
```

StefanPochmann在[这里](https://discuss.leetcode.com/topic/85108/oneliners-p/3)贴的用Scipy/Numpy的Oneliner也是厉害

```python
import scipy.sparse

class Solution(object):
    def findCircleNum(self, M):
        return scipy.sparse.csgraph.connected_components(M)[0]
```

```python
import numpy as np

class Solution(object):
    def findCircleNum(self, M):
        return len(set(map(tuple, (np.matrix(M, dtype='bool')**len(M)).A)))
```
