---
title: Question 524
category: [Data Structure]
tags: [String]
---

![Description](../Assets/Figure/questio524.png)

## Algorithm

- 这个题目一开始觉得有点难，但是实际上我还是想复杂了。
- 基本思路：
  - 对于字典里的每一个单词，判断这个单词能不能被原始字符串s修饰获得（这里其实根本不存在字符串匹配）
  - 要做这个判断，直接一个字符一个字符比，如果`s[i] == word[j]`，那么就看`word[j+1]`能不能被将来的某一个`s[i']`匹配，整个这个过程只需要遍历一遍字符串就可以了。

## Comment

- 一开始觉得这个是字符串匹配的问题，后来发现比匹配简单多了。

## Code


```python
class Solution(object):
    def findLongestWord(self, s, d):
        """
        :type s: str
        :type d: List[str]
        :rtype: str
        """
        ans = [""]
        for voc in d:
            j = 0
            for char in s:
                if char == voc[j]:
                    j = j + 1
                if j == len(voc):
                    break
            if j == len(voc):
                ans.append(voc)
        ans.sort(key = lambda x: (-len(x), x))
        return ans[0]
```
