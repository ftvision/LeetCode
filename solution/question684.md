---
title: Question 684
category: [Algorithm]
tags: [Union Find]
---

![Description](../Assets/Figure/questio684.png)

## Algorithm

- 这个题目因为是无向图，所以就是一个Union-Find的问题，就是把edge的两个节点放到一个union里面去，如果出现一个edge的两个节点已经在同一个union了，说明形成了环，这条边就是多余的。

## Comment

- 还是比较直观的

## Code


```python
class Solution(object):
    def findRedundantConnection(self, edges):
        """
        :type edges: List[List[int]]
        :rtype: List[int]
        """
        def union_find(i):
            if union[i] != i:
                union[i] = union_find(union[i])
            return union[i]

        union = [i for i in range(len(edges))]
        for edge in edges:
            u_a, u_b = union_find(edge[0]- 1), union_find(edge[1] - 1)
            if u_a != u_b:
                union[u_a] = u_b
            else:
                ans = edge
                break
        return ans
```

[StefanPochmann Smart Implementation](https://discuss.leetcode.com/topic/104691/unicode-find-5-short-lines)

```python
def findRedundantConnection(self, edges):
    tree = ''.join(map(chr, range(1001)))
    for u, v in edges:
        if tree[u] == tree[v]:
            return [u, v]
        tree = tree.replace(tree[u], tree[v])
```
