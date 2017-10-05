---
title: Question 320
category: [Algorithm]
tags: [Backtracking]
---

![Description](../Assets/Figure/questio320.png)

## Algorithm

- 这个题目基本上就是回溯，但是要遍历整个解并不是非常直接，主要是有很多corner case需要考虑。我不确定我的解写的很好。
- 这里摘录了网上写得漂亮的方法，当然StefanPochmann在[这里](https://discuss.leetcode.com/topic/32108/python-solutions/2)的写法也很厉害

## Comment

- 虽然算法很直接，但是实现起来并不是那么直接

## Code

```python
class Solution(object):
    def generateAbbreviations(self, word):
        """
        :type word: str
        :rtype: List[str]
        """
        def search(word):
            if not word:
                return []
            ans = []
            for length in range(1, len(word) + 1):
                for j in range(len(word) - length + 1):
                    prefix = word[:j] + str(length)
                    result = search(word[j + length + 1:])
                    ans.extend([prefix + word[j + length] + x for x in result])
                    ans.append(prefix+word[j+length:])
            return ans
        return search(word) + [word]

```

[这个](https://discuss.leetcode.com/topic/45588/simple-python-solution-with-explanation)算法写的很不错

```python
class Solution(object):
    def generateAbbreviations(self, word):
        """
        :type word: str
        :rtype: List[str]
        """
        def helper(word, pos, cur, count, result):
            if len(word) == pos:
                # Once we reach the end, append current to the result
                result.append(cur + str(count) if count > 0 else cur)
            else:
                # Skip current position, and increment count
                helper(word, pos + 1, cur, count + 1, result)
                # Include current position, and zero-out count
                helper(word, pos + 1, cur + (str(count) if count > 0 else '') + word[pos], 0, result)

        result = []
        helper(word, 0, '', 0, result)
        return result
```
