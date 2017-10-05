---
title: Question 139
category: [Algorithm]
tags: [Dynamic Programming]
---

![Description](../Assets/Figure/questio139.png)

## Algorithm

- 这个题目可以直接做O(n^2)的DP
  - `F[i]`表示截止到第i的字符是否能够分解成字典
  - `F[i] = F[j] and S[j+1]...S[i] in Dict`，只要存在一个这样的分解就OK

## Comment

- `any()`这个函数自有妙用

## Code


```python
class Solution(object):
    def wordBreak(self, s, wordDict):
        ans = [True] + [False] * len(s)
        wordDict = set(wordDict)
        for i in range(1, len(s) + 1):
            ans[i] = any(ans[i] or ans[j] and s[j:i] in wordDict for j in range(len(s)))
            #print i, ans[i]
        return ans[len(s)]
```

StefanPochmann的[实现](https://discuss.leetcode.com/topic/16701/4-lines-in-python)

```python
def wordBreak(self, s, words):
    ok = [True]
    for i in range(1, len(s)+1):
        ok += any(ok[j] and s[j:i] in words for j in range(i)),
    return ok[-1]
```
